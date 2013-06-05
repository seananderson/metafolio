#' Monte Carlo the weights into portfolios and record the simulation
# output and portfolio metrics (mean and variance for now)
#' @export

monte_carlo_portfolios <- function(weights_matrix, n_sims = 500, mean_b = 1000, burn = 1:30, ...) {

  b_vals_matrix <- weights_matrix * mean_b * ncol(weights_matrix)
  n_pop <- ncol(weights_matrix)

  port_vals = matrix(ncol = 2, nrow = n_sims)

  sims_out <- list() # to store simulation output


  for(k in 1:n_sims) {
    b_vals <- b_vals_matrix[k, ]
    if(k == 1)
      sims_out[[k]] <- meta_sim(b = b_vals, use_cache = FALSE, n_pop = n_pop, ...)
    else
      sims_out[[k]] <- meta_sim(b = b_vals, use_cache = TRUE, n_pop = n_pop, ...)
    port.x <- rowSums(sims_out[[k]]$A[-burn, ])
    ret.x <- diff(log(port.x))
    var.x <- var(ret.x)
    mean.x <- mean(ret.x)
    port_vals[k, ] <- c(mean.x, var.x)
    if(k%%25 == 0) print(k)
  }
return(list(port_vals = port_vals, n_sims = 500, sims_out = sims_out))
}

monte_carlo_portfolios_foreach <- function(weights_matrix, n_sims = 500, mean_b = 1000, burn = 1:30, ...) {

  b_vals_matrix <- weights_matrix * mean_b * ncol(weights_matrix)
  n_pop <- ncol(weights_matrix)

  port_vals = matrix(ncol = 2, nrow = n_sims)

  sims_out <- list() # to store simulation output

#require(foreach)

# just set cache:
junk <- meta_sim(b = b_vals_matrix[1,], use_cache = FALSE, n_pop = n_pop, ...)
  
sims_out <- foreach(k = 1:n_sims) %dopar% {
    b_vals <- b_vals_matrix[k, ]
    meta_sim(b = b_vals, use_cache = TRUE, n_pop = n_pop, ...)
    #port.x <- rowSums(sims_out[[k]]$A[-burn, ])
    #ret.x <- diff(log(port.x))
    #var.x <- var(ret.x)
    #mean.x <- mean(ret.x)
    #port_vals[k, ] <- c(mean.x, var.x)
  }

#return(list(port_vals = port_vals, n_sims = 500, sims_out = sims_out))
sims_out
}                                                                                          

  


