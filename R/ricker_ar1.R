# Ricker model with AR1 error structure
#' @export

ricker_ar1 <- function(spawners, a, b, sigma_sq_v = 0, v_t_minus1 = 0, rho = 0) {
  v_t <- rnorm(1, mean = 0, sd = sqrt(sigma_sq_v)) # process noise
  v_t_ar1 <- v_t_minus1 * rho + v_t
  recruits <- spawners * exp(a * (1 - spawners / b) + v_t_ar1)
  list(recruits = recruits, eps = v_t_ar1)
}


