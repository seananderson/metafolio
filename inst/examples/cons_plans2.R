# look at conservation rules of thumb
# This file looks at different spatial strategies of conservation
# This version uses the new package functions

w_plans <- list() 
w_plans[[1]] <- c(5, 1000, 5, 1000, 5, 5, 1000, 5, 1000, 5)
w_plans[[2]] <- c(5, 5, 5, 1000, 1000, 1000, 1000, 5, 5, 5)
w_plans[[3]] <- c(rep(1000, 4), rep(5, 6))
w_plans[[4]] <- rev(w_plans[[3]])
w_plans[[5]] <- c(1000, 1000, 5, 5, 5, 5, 5, 5, 1000, 1000)

n_trials <- 200 # number of trials at each n conservation plan
num_pops <- c(10, 10, 10, 10, 10) # n pops to conserve
n_plans <- length(num_pops) # number of plans
w <- list()
for(i in 1:n_plans) { # loop over number conserved
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

plot_sim_ts(meta_sim(b = w[[4]][[2]], n_pop = 10, env_params =
    arma_env_params, env_type = "arma", assess_freq = 5),
  years_to_show = 70, burn = 30)

x_arma_sp <- run_cons_plans(w, env_type = "arma", env_params =
  arma_env_params)

cols <- RColorBrewer::brewer.pal(5, "Dark2")

## Linear:
linear_env_params <- list(min_value = 12, max_value = 20, sigma_env = 0.001,
  start_t = 30)

#plot_sim_ts(meta_sim(b = rep(1000, 10), n_pop = 10, env_params =
    #linear_env_params, env_type = "linear", assess_freq = 5),
  #years_to_show = 100, burn = 0)

plot_sim_ts(meta_sim(b = w[[4]][[1]], n_pop = 16, env_params =
    linear_env_params, env_type = "linear", assess_freq = 5),
  years_to_show = 70, burn = 30)

x_linear_sp <- run_cons_plans(w, env_type = "linear", env_params = linear_env_params) 

par(mfrow = c(1, 2))
xlim <- c(0, 0.15)
ylim <- c(-0.018, 0.017)
par(las = 1, cex = 0.8, mar = c(0, 0, 0, 0), oma = c(5, 5, .5, .5), tck = -0.02, mgp = c(2, .6, 0)) 
plot_cons_plans(x_arma_sp, plans_name = num_pops, cols = cols,
  add_all_efs = FALSE, xlim = xlim, ylim = ylim, add_legend = FALSE)
plot_cons_plans(x.linear, plans_name = num_pops, cols = cols,
  add_all_efs = FALSE, xlim = xlim, ylim = ylim, y_axis = FALSE, add_legend = TRUE)
mtext("Mean of generation-to-generation\nrate of change", side = 1, line = 3, outer = TRUE, cex = 0.8)
par(las = 0)
mtext("Variance of generation-to-generation\nrate of change", side = 2, line = 3, outer = TRUE, cex = 0.8)

