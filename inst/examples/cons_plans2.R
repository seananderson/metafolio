# look at conservation rules of thumb
# This file looks at different spatial strategies of conservation
# This version uses the new package functions

set.seed(1)
USE_CACHE <- TRUE

w_plans <- list() 
w_plans[[1]] <- c(5, 1000, 5, 1000, 5, 5, 1000, 5, 1000, 5)
w_plans[[2]] <- c(5, 5, 5, 1000, 1000, 1000, 1000, 5, 5, 5)
w_plans[[3]] <- c(rep(1000, 4), rep(5, 6))
w_plans[[4]] <- rev(w_plans[[3]])
#w_plans[[5]] <- c(1000, 1000, 5, 5, 5, 5, 5, 5, 1000, 1000)
#plans_name_sp <- c("Full range of responses", "Most stable only", "One half", "One half", "Most asynchronous only")
plans_name_sp <- c("Full range of responses", "Most stable only", "One half", "One half")

n_trials <- 500 # number of trials at each n conservation plan
num_pops <- c(10, 10, 10, 10) # n pops to conserve
n_plans <- length(num_pops) # number of plans
w <- list()
for(i in 1:n_plans) { # loop over plans
 w[[i]] <- list()
 for(j in 1:n_trials) { # loop over trials
   w[[i]][[j]] <- matrix(w_plans[[i]], nrow = 1)
 }
}

## ARMA:
arma_env_params <- list(mean_value = 16, ar = 0.1, sigma_env = 2, ma = 0)

#plot_sim_ts(meta_sim(b = rep(1000, 10), n_pop = 10, env_params =
    #arma_env_params, env_type = "arma", assess_freq = 5),
  #years_to_show = 100, burn = 0)

pdf("spatial-arma-sim.pdf", width = 5, height = 7)
plot_sim_ts(meta_sim(b = w[[1]][[1]], n_pop = 10, env_params =
    arma_env_params, env_type = "arma", assess_freq = 5),
  years_to_show = 70, burn = 30)
dev.off()

if(!USE_CACHE) {
x_arma_sp <- run_cons_plans(w, env_type = "arma", env_params =
  arma_env_params)
  save(x_arma_sp, file = "x_arma_sp.rda")
} else {
  load("x_arma_sp.rda")
}


## Linear:
linear_env_params <- list(min_value = 12, max_value = 20, sigma_env = 0.001,
  start_t = 30)

#plot_sim_ts(meta_sim(b = rep(1000, 10), n_pop = 10, env_params =
    #linear_env_params, env_type = "linear", assess_freq = 5),
  #years_to_show = 100, burn = 0)

pdf("spatial-linear-sim.pdf", width = 5, height = 7)
plot_sim_ts(meta_sim(b = w[[1]][[1]], n_pop = 10, env_params =
    linear_env_params, env_type = "linear", assess_freq = 5),
  years_to_show = 70, burn = 30)
dev.off()

if(!USE_CACHE) {
  x_linear_sp <- run_cons_plans(w, env_type = "linear", env_params =
    linear_env_params) 
  save(x_linear_sp, file = "x_linear_sp.rda")
} else {
  load("x_linear_sp.rda")
}

cols <- RColorBrewer::brewer.pal(5, "Dark2")

#pdf("cons-plans-spatial.pdf", width = 7, height = 3.7)
#par(mfrow = c(1, 2))
pdf("spatial-mv.pdf", width = 6.5, height = 6.8)
layout(rbind(
  c(1, 2),
  c(1, 2),
  c(1, 2),
  c(1, 2),
  c(7, 8), # padding
  c(3, 5),
  c(3, 5),
  c(4, 6),
  c(4, 6)))

xlim <- c(0.02, 0.15)
ylim <- c(-0.017, 0.017)
par(las = 1, cex = 0.8, mar = c(0, 0, 0, 0), oma = c(4, 5.2, 1.5, .5), tck = -0.02, mgp = c(2, .6, 0)) 
plot_cons_plans(x_arma_sp, plans_name = plans_name_sp, cols = cols,
  add_all_efs = FALSE, xlim = xlim, ylim = ylim, add_legend = FALSE)
mtext("(a) Short-term environmental fluctuations", side = 3, line = 0.2, cex = 0.8, adj = 0.05)
par(las = 0)
mtext("Mean of generation-to-generation\nrate of change", side = 2, line = 3, outer = FALSE, cex = 0.8)
par(las = 1)
plot_cons_plans(x_linear_sp, plans_name = plans_name_sp, cols = cols,
  add_all_efs = FALSE, xlim = xlim, ylim = ylim, y_axis = FALSE, add_legend = TRUE)
mtext("(b) Long-term environmental change", side = 3, line = 0.2, cex = 0.8, adj = 0.05)
mtext("Variance of generation-to-generation rate of change", side = 1, line = 2.25, outer = FALSE, cex = 0.8, adj = 3)
#dev.off()

###############################
# time series plots:

par(tck = -0.035) 
cons_arma_ts <- list()
for(i in 1:4) {
  use_cache <- ifelse(i == 1, FALSE, TRUE)
  cons_arma_ts[[i]] <- meta_sim(b = w[[i]][[1]], n_pop = 10, env_params =
    arma_env_params, env_type = "arma", assess_freq = 5,
    use_cache = use_cache)
}
cons_linear_ts <- list()
for(i in 1:4) {
  use_cache <- ifelse(i == 1, FALSE, TRUE)
  cons_linear_ts[[i]] <- meta_sim(b = w[[i]][[1]], n_pop = 10, env_params =
    linear_env_params, env_type = "linear", assess_freq = 5,
    use_cache = use_cache)
}
burn <- 1:30

#plot_sp_A_ts <- function(X, ylim, y_axis = TRUE) {
  ##A_range <- ldply(X, function(x) range(rowSums(x$A[-burn, ])))
  #for(i in 1:4){
    #if(i %in% c(1, 3)) {
      #plot(1,1,ylim = ylim, xlim = c(1, 70), type = "n",
        #xlab = "", ylab = "", xaxt = "n", axes = FALSE, yaxs = "i")
    #if(y_axis)  axis(2, col=  "grey50", at = pretty(axTicks(2), n = 2))
    #}

    #x <- X[[i]]$A[-burn, ]
    #port.x <- rowSums(x)
    #lines(1:length(port.x), port.x, col = cols[i], lwd = 1.5, lty = 1)
    #box(col = "grey50")
  #}
    #axis(1, col=  "grey50")
#}

#par(mfrow = c(2, 1))
#par(las = 1, cex = 0.8, mar = c(0, 0, 0, 0), oma = c(4, 5.2, 1.5, .5), tck = -0.02, mgp = c(2, .6, 0)) 

plot_sp_A_ts(cons_arma_ts, ylim = c(0000, 11500), start_new_plots = c(1, 3), labels = c("(c)", "(d)", "(e)", "(f)"))

par(las = 0)
mtext("Abundance", side = 2, line = 3, outer = FALSE, cex = 0.8, adj = 2)
par(las =1)

#par(mfrow = c(2, 1))
#par(las = 1, cex = 0.8, mar = c(0, 0, 0, 0), oma = c(4, 5.2, 1.5, .5), tck = -0.02, mgp = c(2, .6, 0)) 
plot_sp_A_ts(cons_linear_ts, ylim = c(0000, 11500), y_axis = FALSE, start_new_plots = c(1, 3), labels = c("(d)", "(d)", "(f)", "(f)"))


par(xpd = NA)
mtext("Generation", side = 1, line = 2, outer = FALSE, cex = 0.8, adj = -.2)
par(xpd = FALSE)
dev.off()
