# generate a matrix of straying proportions

generate_straying_matrix <- function(n_pop, stray_fraction, stray_decay_rate){
  
  stray_mat <- matrix(ncol = n_pop, nrow = n_pop)
  for(i in 1:n_pop) {
    for(j in 1:n_pop) {
      # Cooper and Mangel 1999 eq (2):
      stray_mat[i,j] <- stray_fraction * 
      exp(-stray_decay_rate * abs(i - j))
    }
  }
  #browser()

  diag(stray_mat) <- 0 # no self-straying
  normalization <- rowSums(stray_mat) # so no salmon or lost or gained
#   stray_mat_star <- matrix(ncol = ncol(stray_mat), nrow = nrow(stray_mat))
#   for(i in 1:nrow(stray_mat)) {
#     stray_mat_star[i, ] <- stray_mat[i, ] / normalization[i]
#   }

  #image(stray_mat_star)
  #image((stray_mat / normalization) * stray_fraction)

  stray_mat <- (stray_mat / normalization) * stray_fraction # to match the desired overall straying rate by stream
  return(stray_mat)
}

#generate_straying_matrix(4, 0.01, 0.3)
#image(stray_mat)
