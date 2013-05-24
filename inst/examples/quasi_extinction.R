#' Develop quasi-extinction concept

require(plyr)

w1 <- structure(c(5, 1000, 5, 1000, 5, 5, 1000, 5, 1000, 5), .Dim = c(1L, 10L))

arma_env_params <- list(mean_value = 16, ar = 0.1, sigma_env = 2, ma = 0)

x <- meta_sim(b = w1, n_pop = 10, env_params = arma_env_params, env_type = "arma", assess_freq = 5, sigma_v = 0.6)

conserved_pops <- which(x$A[1, ] > 5)
subpop_qe <- adply(x$A[, conserved_pops], 2, function(y) {
  temp <- is_quasi_ext(y, thresh = 200, duration = 1)
  with(temp, data.frame(is_qe = is_qe, first_qe = first_qe))
})

meta_qe <- is_quasi_ext(rowSums(x$A), thresh = 200*4, duration = 1)

print(meta_qe)
print(subpop_qe)

# OK, now bring
