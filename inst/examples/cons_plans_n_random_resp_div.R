# Show difference of increasing the number of streams you maintain
# with unknown response diversity
#
# In this version, the response diversity is randomly drawn

# in this version, the pops are wiped out; total abundance changes
n_trials <- 200 # number of trials at each n conservation plan
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

plot_sim_ts(meta_sim(b = w[[1]][[2]], n_pop = 16, env_params =
    arma_env_params, env_type = "arma", assess_freq = 5),
  years_to_show = 70, burn = 30)

x_arma_n <- run_cons_plans(w, env_type = "arma", env_params =
  arma_env_params)


## Linear:
linear_env_params <- list(min_value = 12, max_value = 20, sigma_env = 0.001,
  start_t = 30)

#plot_sim_ts(meta_sim(b = rep(1000, 10), n_pop = 10, env_params =
    #linear_env_params, env_type = "linear", assess_freq = 5),
  #years_to_show = 100, burn = 0)

plot_sim_ts(meta_sim(b = w[[4]][[1]], n_pop = 16, env_params =
    linear_env_params, env_type = "linear", assess_freq = 5),
  years_to_show = 70, burn = 30)

x_linear_n <- run_cons_plans(w, env_type = "linear", env_params = linear_env_params) 

cols <- RColorBrewer::brewer.pal(5, "Spectral")
pdf("cons-plans-n.pdf", width = 7, height = 3.7)
par(mfrow = c(1, 2))
xlim <- c(0.008, 0.15)
ylim <- c(-0.017, 0.017)
par(las = 1, cex = 0.8, mar = c(0, 0, 0, 0), oma = c(4, 5.5, .5, .5), tck = -0.02, mgp = c(2, .6, 0)) 
plot_cons_plans(x_arma_n, plans_name = plans_name_n, cols = cols,
  add_all_efs = FALSE, xlim = xlim, ylim = ylim, add_legend = FALSE)
mtext("(a) Short-term environmental fluctuations", side = 3, line = -1.2, cex = 0.8, adj = 0.05)
plot_cons_plans(x_linear_n, plans_name = plans_name_n, cols = cols,
  add_all_efs = FALSE, xlim = xlim, ylim = ylim, y_axis = FALSE, add_legend = TRUE)
mtext("(b) Long-term environmental change", side = 3, line = -1.2, cex = 0.8, adj = 0.05)
mtext("Mean of generation-to-generation rate of change", side = 1, line = 2.5, outer = TRUE, cex = 0.8)
par(las = 0)
mtext("Variance of generation-to-generation\nrate of change", side = 2, line = 3, outer = TRUE, cex = 0.8)
dev.off()
