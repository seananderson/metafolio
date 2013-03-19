#' Run multiple optimizations

# source files:
rm(list = ls())
setwd("~/Dropbox/ms/metafolio/inst/examples/")
metafolio_files <-  list.files(path = "../../R/")
for(i in 1:length(metafolio_files)){
  source(paste("../..//R/", metafolio_files[i], sep = ""));rm(i)}
col_pal <- rev(gg_color_hue(10))

# run it:
get_min_var_weights <- function(n_sims = 600, n_pop = 10){
  #browser()

  weights_matrix <-  create_asset_weights(n_pop = n_pop, n_sims = n_sims, 
    weight_lower_limit = 0.001)

  mc_ports <- monte_carlo_portfolios(weights_matrix = weights_matrix,
    n_sims = n_sims, mean_b = 1000)

  ef_dat <- plot_efficient_portfolios(port_vals = mc_ports$port_vals, 
    weights_matrix = weights_matrix, pal = col_pal, plot = FALSE)

  min_var_sim <- mc_ports$sims_out[[ef_dat$min_var_port_id]]
  weights <- min_var_sim$b

  #save(mc_ports, file = paste("mc_ports_", iter, ".rda", sep = ""))

  # run an equal weighted portfolio:
  b_vals_matrix <- rep(1000, n_pop)
  port_vals = matrix(ncol = 2, nrow = 1)
  b_vals <- b_vals_matrix
  eq_sim <- meta_sim(b = b_vals, use_cache = TRUE, n_pop = n_pop)

  save(eq_sim, file = paste("eq_port_", iter, ".rda", sep = ""))
  burn <- 1:30
  port.x <- rowSums(eq_sim$A[-burn, ])
  ret.x <- diff(log(port.x))
  var.x <- var(ret.x)
  mean.x <- mean(ret.x)
  eq_weight_cv <- var.x

  port.minv <- rowSums(min_var_sim$A[-burn, ])
  ret.minv <- diff(log(port.minv))
  var.minv <- var(ret.minv)
  mean.minv <- mean(ret.minv)
  minv_cv <- var.minv


## find out variance (and mean?) of equal-weighted portfolios and min-var ports
## and record those values
## how much better?

  iter <<- iter + 1
  return(list(weights = weights, eq_weight_cv = eq_weight_cv, minv_cv = minv_cv))
}

iter <<- 1
min_var_weights <- matrix(ncol = 10, nrow = 40)
eq_weight_cv <- vector()
minv_cv <- vector()

for(i in 1:nrow(min_var_weights)) {
  out <- get_min_var_weights()
  min_var_weights[i, ] <- out$weights
  eq_weight_cv[i] <- out$eq_weight_cv
  minv_cv[i] <- out$minv_cv
}

save(min_var_weights, eq_weight_cv, minv_cv, file = "min_var_weights_10pops_40mpt.rda")

