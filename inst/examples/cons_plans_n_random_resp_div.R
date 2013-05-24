# Show difference of increasing the number of streams you maintain
# with unknown response diversity
#
# In this version, the response diversity is randomly drawn

set.seed(1)
USE_CACHE <- TRUE

# in this version, the pops are wiped out; total abundance changes
n_trials <- 50 # number of trials at each n conservation plan
num_pops <- c(2, 4, 8, 16) # n pops to conserve
n_plans <- length(num_pops) # number of plans
w <- list()
for(i in 1:n_plans) { # loop over number conserved
 w[[i]] <- list()
 for(j in 1:n_trials) { # loop over trials
   w[[i]][[j]] <- matrix(rep(1000, 16), nrow = 1)
   w[[i]][[j]][-sample(1:16, num_pops[i])] <- 5 # conserve num_pops[i] populations; wipe out rest
 }
}
plans_name_n <- paste(num_pops, "populations")

## ARMA:
arma_env_params <- list(mean_value = 16, ar = 0.1, sigma_env = 2, ma = 0)

#plot_sim_ts(meta_sim(b = rep(1000, 10), n_pop = 10, env_params =
    #arma_env_params, env_type = "arma", assess_freq = 5),
  #years_to_show = 100, burn = 0)

pdf("n-arma-sim.pdf", width = 5, height = 7)
plot_sim_ts(meta_sim(b = w[[1]][[2]], n_pop = 16, env_params =
    arma_env_params, env_type = "arma", assess_freq = 5),
  years_to_show = 70, burn = 30)
dev.off()

if(!USE_CACHE) {
x_arma_n <- run_cons_plans(w, env_type = "arma", env_params =
  arma_env_params)
  save(x_arma_n, file = "x_arma_n.rda")
} else {
  load("x_arma_n.rda")
# has two list elements: "plans_mv" and "plans_port"
}


## Linear:
linear_env_params <- list(min_value = 12, max_value = 20, sigma_env = 0.001,
  start_t = 30)

#plot_sim_ts(meta_sim(b = rep(1000, 10), n_pop = 10, env_params =
    #linear_env_params, env_type = "linear", assess_freq = 5),
  #years_to_show = 100, burn = 0)

pdf("n-linear-sim.pdf", width = 5, height = 7)
plot_sim_ts(meta_sim(b = w[[4]][[1]], n_pop = 16, env_params =
    linear_env_params, env_type = "linear", assess_freq = 5),
  years_to_show = 70, burn = 30)
dev.off()

if(!USE_CACHE) {
x_linear_n <- run_cons_plans(w, env_type = "linear", env_params = linear_env_params) 
  save(x_linear_n, file = "x_linear_n.rda")
} else {
  load("x_linear_n.rda")
# has two list elements: "plans_mv" and "plans_port"
}

cols <- RColorBrewer::brewer.pal(5, "Spectral")
pdf("cons-plans-n.pdf", width = 6.5, height = 6.8)

layout(rbind(
  #c(1, 2),
  #c(1, 2),
  #c(1, 2),
  #c(1, 2),
  #c(5, 6), # padding
  #c(3, 4),
  #c(3, 4)))
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

#par(mfrow = c(1, 2))
xlim <- c(0.008, 0.15)
ylim <- c(-0.017, 0.017)
par(las = 1, cex = 0.8, mar = c(0, 0, 0, 0), oma = c(4, 5.2, 1.5, .5), tck = -0.02, mgp = c(2, .6, 0)) 
plot_cons_plans(x_arma_n$plans_mv, plans_name = plans_name_n, cols = cols,
  add_all_efs = FALSE, xlim = xlim, ylim = ylim, add_legend = FALSE)
mtext("(a) Short-term environmental fluctuations", side = 3, line = 0.2, cex = 0.8, adj = 0.05)
par(las = 0)
mtext("Mean of generation-to-generation\nrate of change", side = 2, line = 3, outer = FALSE, cex = 0.8)
par(las = 1)
plot_cons_plans(x_linear_n$plans_mv, plans_name = plans_name_n, cols = cols,
  add_all_efs = FALSE, xlim = xlim, ylim = ylim, y_axis = FALSE, add_legend = TRUE)
mtext("(b) Long-term environmental change", side = 3, line = 0.2, cex = 0.8, adj = 0.05)
mtext("Variance of generation-to-generation rate of change", side = 1, line = 2.25, outer = FALSE, cex = 0.8, adj = 4)
#dev.off()


# ignore below for now
# 2013-05-18 
# possible ts plots - TODO not right - "spatial" element should be
# fixed between runs, right now is random
plot_sp_A_ts <- function(X, ylim, x_axis = TRUE, y_axis = TRUE, rate = FALSE, lwd = 1.7, y_axis_ticks = NULL, start_new_plots = 1, labels = NULL, burn = 30, ...) {
  #A_range <- ldply(X, function(x) range(rowSums(x$A[-burn, ])))
  burn <- 1:burn
  for(i in 1:4){
    if(i %in% start_new_plots) {
      plot(1,1,ylim = ylim, xlim = c(1, 70), type = "n",
        xlab = "", ylab = "", xaxt = "n", axes = FALSE, yaxs = "i", ...)
      if(!is.null(labels)) {
        mtext(labels[i], side = 3, line = -1.2, cex = 0.8, adj = 0.02)
      }
    if(y_axis)  {
      if(is.null(y_axis_ticks)) {
        axis(2, col=  "grey50", at = pretty(axTicks(2), n = 2))
      } else {
        axis(2, col=  "grey50", at = y_axis_ticks)
      }
    }
    }

    x <- X[[i]]$A[-burn, ]
    port.x <- rowSums(x)
    if(!rate) {
    lines(1:length(port.x), port.x, col = cols[i], lwd = lwd, lty = 1)
    } else {
    lines(2:length(port.x), diff(log(port.x)), col = cols[i], lwd = lwd, lty = 1)
    }
    box(col = "grey50")
  }
  if(x_axis)
    axis(1, col=  "grey50")
}

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

#par(mfrow = c(2, 1), mar = c(0,0,0,0))
plot_sp_A_ts(cons_arma_ts, ylim = c(-0.7, 0.7), rate = TRUE, x_axis = FALSE, labels = "(c)")

par(las = 0)
mtext("Rate of change", side = 2, line = 3, outer = FALSE, cex = 0.8)
par(las =1)

#plot_sp_A_ts(cons_linear_ts, ylim = c(-1, 1), rate = TRUE)
plot_sp_A_ts(cons_arma_ts, ylim = c(1500, 40000), rate = FALSE, log = "y", y_axis = TRUE, y_axis_ticks = c(2000, 5000,  10000, 20000), labels = "(d)")
par(xpd = NA)
mtext("Generation", side = 1, line = 2, outer = FALSE, cex = 0.8)
par(xpd = FALSE)

par(las = 0)
mtext("Abundance", side = 2, line = 3, outer = FALSE, cex = 0.8)
par(las =1)

dev.off()
