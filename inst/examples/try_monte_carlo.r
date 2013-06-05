# Monte Carlo:

# arma
arma_env_params <- list(mean_value = 16, ar = 0.1, sigma_env = 2, ma = 0)
weights_matrix <- create_asset_weights(n_pop = 10, n_sims = 200, 
  weight_lower_limit = 0.001)
mc_ports <- monte_carlo_portfolios(weights_matrix = weights_matrix,
  n_sims = 200, mean_b = 1000, env_params = arma_env_params, assess_freq = 20, env_type = "arma")
ef_dat <- plot_efficient_portfolios(port_vals = mc_ports$port_vals, pal = 
  col_pal, weights_matrix = weights_matrix)

# linear
linear_env_params <- list(min_value = 12, max_value = 20, sigma_env = 0.001,
  start_t = 30)
weights_matrix <- create_asset_weights(n_pop = 10, n_sims = 1000, 
  weight_lower_limit = 0.005)

#weights_matrix <- matrix(nrow = 1000, ncol = 10)
#for(i in 1:nrow(weights_matrix)) {
  #conserved <- sample(1:10, 4)
  #not_conserved <- (1:10)[-conserved]
  #weights_matrix[i, conserved] <- 1000
  #weights_matrix[i, not_conserved] <- 5
#}
mc_ports <- monte_carlo_portfolios(weights_matrix = weights_matrix,
  n_sims = nrow(weights_matrix), mean_b = 403, env_params = linear_env_params, assess_freq = 20, env_type = "linear", add_impl_error = FALSE)
ef_dat <- plot_efficient_portfolios(port_vals = mc_ports$port_vals, pal = 
  col_pal, weights_matrix = weights_matrix)

w_plans <- list() 
w_plans[[1]] <- c(5, 1000, 5, 1000, 5, 5, 1000, 5, 1000, 5)
w_plans[[2]] <- c(5, 5, 5, 1000, 1000, 1000, 1000, 5, 5, 5)
w_plans[[3]] <- c(rep(1000, 4), rep(5, 6))
w_plans[[4]] <- rev(w_plans[[3]])

m1 <- meta_sim(b = w_plans[[1]], use_cache = TRUE, n_pop = 10, env_params = linear_env_params, assess_freq = 20, env_type = "linear")
m1 <- meta_sim(b = rep(1000, 10), use_cache = TRUE, n_pop = 10, env_params = linear_env_params, assess_freq = 20, env_type = "linear")
points(get_port_vals(m1)[c(2, 1)], col = "pink", cex = 4, pch = 20)


