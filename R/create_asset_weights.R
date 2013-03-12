# create asset weights matrix for portfolios
create_asset_weights <- function(
  n_pop, # number of subpops
  n_sims, # number of simulations
  weight_lower_limit = 0.02 # lowest fraction allowed for a subpop weight; 
  #e.g. a value of 0.02 means a subpopulation will at worst be
  # assigned 2% of the carrying capacity (technically the b value in a
  #  Ricker curve) of the total carrying capacity
  # obviously, this is dependent on how many subpops you have
  ) {
  weights_matrix <- matrix(ncol = n_pop, nrow = n_sims)
  for(i in 1:n_sims) {
    w_i <- 0
    while(min(w_i) < weight_lower_limit) { # ensure no weights are too small 
      w_i <- runif(n_pop)
      w_i <- w_i / sum(w_i) # weights that add to one
    }
    weights_matrix[i,] <-  w_i
  }
  return(weights_matrix)
}

