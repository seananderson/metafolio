# Here, examine a scenario where you start with a fixed quantity of `b` to
# invest, different starting values of `b`, and `b` declines in absolute
# quantities across the simulations.
#
# Strategies to test:
# (1) Invest evenly in all streams
# (2) Triage: pick those that start above a threshold and distribute
# `b` among them. Put a tiny bit of `b` (5) in the rest.
# (3) Panicker: pick those that start below a threshold and concentrate on
# them, put some `b` (a bit above extinction by the end) in the bigger ones.
#
# Have `b` decline continuously by some constant magnitude across stocks. E.g.
# have `b` decline by 200 units over 100 years.
#
# is is respon. diversity, initial capacity a better preditor...
#
# simpler idea: start with X quantity of b and you can distribute it however...
# you can either distribute your b as follows:
# in 2, 4, 8, or 16 populations with the b divided and 5 in the rest
# so in the fewer Ns, they will all go to extinction or near extinction
# at higher Ns, they will stay far away from extinction

set.seed(1)
USE_CACHE <- FALSE

n_trials <- 300 # number of trials at each n conservation plan
num_pops <- c(2, 4, 8, 12, 16) # n pops to conserve
b_conserve <- 2000 / num_pops
n_plans <- length(num_pops)
w <- list()
for(i in 1:n_plans) { # loop over number conserved
 w[[i]] <- list()
 for(j in 1:n_trials) { # loop over trials
   w[[i]][[j]] <- matrix(rep(b_conserve[i], 16), nrow = 1)
   # conserve num_pops[i] populations; wipe out rest:
   w[[i]][[j]][-sample(1:16, num_pops[i])] <- 5
 }
}
plans_name_n <- paste(num_pops, "populations")

## ARMA:
arma_env_params <- list(mean_value = 16, ar = 0.1, sigma_env = 2, ma = 0)

# pdf_eps("n-arma-sim-2", width = 5, height = 7, type = TYPE)
 eg_arma <- meta_sim(b = w[[1]][[2]], n_pop = 16, env_params =
   arma_env_params, env_type = "arma", assess_freq = 5, max_a =
   thermal_integration(16), decrease_b = 0)
 plot_sim_ts(eg_arma, years_to_show = 70, burn = 30)
# # extra: TODO fixme
 eg_arma <- meta_sim(b = w[[4]][[2]], n_pop = 16, env_params =
   arma_env_params, env_type = "arma", assess_freq = 5, max_a =
   thermal_integration(16), decrease_b = 1.25, sigma_v = 0.7)
 plot_sim_ts(eg_arma, years_to_show = 70, burn = 30)
# dev.off()
#
# pdf_eps("n-arma-sim-16", width = 5, height = 7, type = TYPE)
# eg_arma <- meta_sim(b = w[[4]][[2]], n_pop = 16, env_params =
#   arma_env_params, env_type = "arma", assess_freq = 5, max_a =
#   thermal_integration(16))
# plot_sim_ts(eg_arma, years_to_show = 70, burn = 30)
# dev.off()
 #

if(!USE_CACHE) {
x_arma_n <- run_cons_plans(w, env_type = "arma", env_params =
  arma_env_params, max_a = thermal_integration(16), decrease_b = 1.25, risk_fn = CVaR)
  save(x_arma_n, file = "x_arma_n.rda")
} else {
  load("x_arma_n.rda")
# has two list elements: "plans_mv" and "plans_port"
}

## Linear:
linear_env_params <- list(min_value = 12, max_value = 20, sigma_env = 0.001,
  start_t = 30)

pdf_eps("n-linear-sim-2", width = 5, height = 7, type = TYPE)
eg_linear <- meta_sim(b = w[[1]][[1]], n_pop = 16, env_params =
  linear_env_params, env_type = "linear", assess_freq = 5, max_a =
  thermal_integration(16), decrease_b = 1.25)
plot_sim_ts(eg_linear, years_to_show = 70, burn = 30)
dev.off()

pdf_eps("n-linear-sim-16", width = 5, height = 7, type = TYPE)
eg_linear <- meta_sim(b = w[[4]][[1]], n_pop = 16, env_params =
  linear_env_params, env_type = "linear", assess_freq = 5, max_a =
  thermal_integration(16), decrease_b = 1.25)
plot_sim_ts(eg_linear, years_to_show = 70, burn = 30)
dev.off()

if(!USE_CACHE) {
x_linear_n <- run_cons_plans(w, env_type = "linear",
  env_params = linear_env_params, max_a = thermal_integration(16),
  decrease_b = 1.25, risk_fn = metafolio::CVaR)
  save(x_linear_n, file = "x_linear_n.rda")
} else {
  load("x_linear_n.rda")
# has two list elements: "plans_mv" and "plans_port"
}

cols <- RColorBrewer::brewer.pal(5, "Spectral")
pdf_eps("cons-plans-n", width = 6.5, height = 6.8, type = TYPE)

layout(rbind(
  c(1, 1, 1, 2, 2, 2),
  c(1, 1, 1, 2, 2, 2),
  c(1, 1, 1, 2, 2, 2),
  c(1, 1, 1, 2, 2, 2),
  c(5, 5, 5, 5, 5, 5), # padding
  c(6, 3, 3, 3, 3, 7),
  c(6, 3, 3, 3, 3, 7),
  c(6, 4, 4, 4, 4, 7),
  c(6, 4, 4, 4, 4, 7)))

#1/9 padding
#2/9 botton
#4/9 top

xlim <- c(0.4, 2)
ylim <- c(-0.08, 0.05)
#par(family = "Times")
par(las = 1, cex = 0.8, mar = c(0, 0, 0, 0), oma = c(4, 5.2, 1.5, .5),
  tck = -0.02, mgp = c(2, .6, 0))
plot_cons_plans(x_arma_n$plans_mv, plans_name = plans_name_n, cols = cols,
  add_all_efs = FALSE, xlim = xlim, ylim = ylim, add_legend = TRUE, add_poly = TRUE)

#add_inset_env(eg_arma$env_ts[-c(1:30)], x = 0.12, y = -0.013, size = c(1, .5))

mtext("(a) Short-term environmental fluctuations", side = 3, line = 0.2,
  cex = 0.8, adj = 0.05)

par(las = 0)
mtext("Mean of metapopulation growth rate", side = 2, line = 3,
  outer = FALSE, cex = 0.8)
par(las = 1)
plot_cons_plans(x_linear_n$plans_mv, plans_name = plans_name_n, cols = cols,
  add_all_efs = FALSE, xlim = xlim, ylim = ylim, y_axis = FALSE, add_legend = TRUE, add_poly = TRUE)

#add_inset_env(eg_linear$env_ts[-c(1:30)], x = 0.12, y = -0.013, size = c(1, .5))

mtext("(b) Long-term environmental change", side = 3, line = 0.2, cex = 0.8,
  adj = 0.05)
mtext("Risk of metapopulation growth rate (CVaR)", side = 1, line = 2.25,
  outer = FALSE, cex = 0.8, adj = -3)

## time series plots:
par(tck = -0.035)
w <- list()
for(i in 1:n_plans) { # loop over number conserved
 w[[i]] <- list()
   w[[i]] <- matrix(rep(1000, 16), nrow = 1)
}

   w[[1]][-c(8, 9)] <- 5 # conserve n, wipe out the rest
   w[[2]][-c(7:10)] <- 5 # conserve n, wipe out the rest
   w[[3]][-c(5:12)] <- 5 # conserve n, wipe out the rest
   w[[4]][-c(1:16)] <- 5 # conserve n, wipe out the rest

cons_arma_ts <- list()
for(i in 1:4) {
  use_cache <- ifelse(i == 1, FALSE, TRUE)
  cons_arma_ts[[i]] <- meta_sim(b = w[[i]], n_pop =
    ncol(w[[i]]), env_params = arma_env_params, env_type =
    "arma", assess_freq = 5, use_cache = use_cache, cache_env =
    use_cache)
}
cons_linear_ts <- list()
for(i in 1:4) {
  use_cache <- ifelse(i == 1, FALSE, TRUE)
  cons_linear_ts[[i]] <- meta_sim(b = w[[i]], n_pop =
    ncol(w[[i]]), env_params = linear_env_params, env_type =
    "linear", assess_freq = 5, use_cache = use_cache, cache_env =
    use_cache)
}

plot_sp_A_ts(cons_arma_ts, ylim = c(-0.7, 0.7), rate = TRUE, x_axis = FALSE,
  labels = "(c)\n", cols = cols)

par(las = 0)
mtext("Metapopulation\ngrowth rate", side = 2, line = 3, outer = FALSE, cex = 0.8)
par(las =1)

plot_sp_A_ts(cons_arma_ts, ylim = c(1500, 40000), rate = FALSE, log = "y",
  y_axis = TRUE, y_axis_ticks = c(2000, 5000,  10000, 20000),
  labels = "(d)", cols = cols)
mtext("(d)", side = 3, line = -1.2, cex = 0.8, adj = 0.025)

par(xpd = NA)
mtext("Generation", side = 1, line = 2, outer = FALSE, cex = 0.8)
par(xpd = FALSE)

par(las = 0)
mtext("Metapopulation\nabundance", side = 2, line = 3, outer = FALSE, cex = 0.8)
par(las =1)

dev.off()

# report summary statistics:
# short term summaries:

mean.v <- plyr::ldply(x_arma_n$plans_mv, function(x) mean(x$v))

message("mean variance in growth rate for short term: 4 vs. 16")
message(round(mean.v$V1[2]/mean.v$V1[4], 1))

message("mean variance in growth rate for short term: 8 vs. 16")
message(round(mean.v$V1[3]/mean.v$V1[4], 1))

quant.v <- plyr::laply(x_arma_n$plans_mv, function(x) {
  q.l <- as.numeric(quantile(x$v, probs = 0.125))
  q.u <- as.numeric(quantile(x$v, probs = 0.875))
  q.u - q.l
    }
  )
message("width of 75% quantile of variance for short term: 16 vs. 4")
message(round(quant.v[2]/quant.v[4], 1))

message("width of 75% quantile of variance for short term: 16 vs. 8")
message(round(quant.v[3]/quant.v[4], 1))

# long term summaries:

quant.m <- plyr::laply(x_linear_n$plans_mv, function(x) {
  q.l <- as.numeric(quantile(x$m, probs = 0.125))
  q.u <- as.numeric(quantile(x$m, probs = 0.875))
  q.u - q.l
    }
  )
message("width of 75% quantile of mean for long term: 16 vs. 4")
message(round(quant.m[2]/quant.m[4], 1))

message("width of 75% quantile of mean for long term: 16 vs. 8")
message(round(quant.m[3]/quant.m[4], 1))

message("mean variance in growth rate for long term")
mean.v <- plyr::ldply(x_linear_n$plans_mv, function(x) mean(x$v))
message("16 vs. 4")
message(round(mean.v$V1[2]/mean.v$V1[4], 1))
message("16 vs. 2")
message(round(mean.v$V1[1]/mean.v$V1[4], 1))
message("16 vs. 8")
message(round(mean.v$V1[3]/mean.v$V1[4], 1))
message("8 vs. 4")
message(round(mean.v$V1[2]/mean.v$V1[3], 1))
