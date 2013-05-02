#' look at conservation rules of thumb

USE_CACHE <- TRUE

#library(doMC)
#registerDoMC()
#getDoParWorkers()
#system.time({
#weights_matrix <- create_asset_weights(n_pop = 10, n_sims = 1000, weight_lower_limit = 0.001)
#mc_ports <- monte_carlo_portfolios_foreach(weights_matrix = weights_matrix,
  #n_sims = 1000, mean_b = 1000, add_impl_error = TRUE, start_assessment = 30, assess_freq = 150)
#})

#plot_sim_ts(mc_ports[[3]])

# add depensation!!!!

# linear increasing with noise:
#p <- meta_sim(b = rep(1000, 10), use_cache = FALSE, n_pop = 10, add_impl_error = TRUE, start_assessment = 30, assess_freq = 50, env_type = "linear",env_params = list(min_value = 10, max_value = 20, sigma_env = 0.2))
#plot_sim_ts(p, burn = 1:30, years_to_show = 90)

# sine:
#p <- meta_sim(b = rep(1000, 10), use_cache = FALSE, n_pop = 10, add_impl_error = TRUE, start_assessment = 30, assess_freq = 50, env_type = "sine",
  #env_params = list(amplitude = 3.0, ang_frequency = 0.2, phase = runif(1, -pi, pi), mean_value = 14.5, slope = 0.020, sigma_env = 0.50))
#plot_sim_ts(p, burn = 1:30, years_to_show = 90)

# stationary with lots of noise (arma)
#p <- meta_sim(b = rep(1000, 10), use_cache = FALSE, n_pop = 10, add_impl_error = TRUE, start_assessment = 30, assess_freq = 50, env_type = "arma",env_params = list(mean_value = 16, ar = 0.4, sigma_env = 1.4, ma = 0))
#plot_sim_ts(p, burn = 1:30, years_to_show = 90)


w <- matrix(nrow = 5, ncol = 10)
#w[1, ] <- rep(1000, 10)
#w[1, ] <- rep(c(1000, 10), 5)
w[1, ] <- c(10, 2500, 10, 2500, 10, 10, 2500, 10, 2500, 10)
w[2, ] <- c(10,10,10,2500,2500,2500,2500,10,10,10)
w[3,] <- c(rep(2500, 4), rep(10, 6))
w[4,] <- rev(w[3,])
w[5,] <- c(2500, 2500, 10, 10, 10, 10, 10, 10, 2500, 2500)
plans_name <- c("Full range of responses", "Most stable only", "One half", "One half", "Most asynchronous only")
w_show <- c(1, 2, 3,4, 5)

if(USE_CACHE) {
  load("plans_mv.rda")
}else{
  plans_mv_arma <- get_conserv_plans_mv(weights = w, 
    env_type = "arma",
    env_params = list(mean_value = 16, ar = 0.4, sigma_env = 1.4, ma = 0))

  plans_mv_linear <- get_conserv_plans_mv(weights = w, 
    env_type = "linear",
    env_params = list(min_value = 10, max_value = 20, sigma_env = 0.2))
  # TODO Note that this is not balanced around the mean of 16 - change
  # this

  save(plans_mv_arma, plans_mv_linear, file = "plans_mv.rda")
}

source("plot_cons_plans.R")

par(mfrow = c(1, 2))
par(cex = 0.7, mar = c(4,5,0,0), oma = c(.5,.5,.5,.5), mgp = c(3, .5, 0), tck = -0.01, las = 1)
j <- plot_cons_plans(plans_mv_arma, cols = cols, plans_name)
plot_cons_plans(plans_mv_linear, plans_name, cols = cols, xlim = j$xlim, ylim = j$ylim)

