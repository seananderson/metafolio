#' Get beta parameters from mean and variance
est_beta_params <- function(mu, var) {
  alpha <- ((1 - mu) / var - 1 / mu) * mu ^ 2
  beta <- alpha * (1 / mu - 1)
  list(alpha = alpha, beta = beta)
}

#' Add implementation error
#'
#' Add implementation error with a beta distribution.
#'
#' @param mu The mean
#' @param sigma_impl Implementation error standard deviation
#' @export
#' @return
#' A single numeric values representing a sample from a beta
#' distribution with the specified mean and standard deviation.
#'
#' @references
#' Morgan, M. G. & Henrion, M. (1990). Uncertainty: A Guide to Dealing
#' with Uncertainty in Quantitative Risk and Policy Analysis.
#' Cambridge University Press.
#'
#' Pestes, L. R., Peterman, R. M., Bradford, M. J., and Wood, C. C.
#' (2008). Bayesian decision analysis for evaluating management
#' options to promote recovery of a depleted salmon population.
#' 22(2):351-361.
#'
#' http://stats.stackexchange.com/questions/12232/calculating-the-parameters-of-a-beta-distribution-using-the-mean-and-variance
#' @examples
#' y <- sapply(1:200, function(x) impl_error(0.5, 0.2))
#' hist(y)
#'
#' y <- sapply(1:200, function(x) impl_error(0.3, 0.1))
#' hist(y)



impl_error <- function(mu, sigma_impl) {
  if(mu > 1 | mu < 0) stop("mu must be between 0 and 1")
  var <- sigma_impl ^ 2
  bp <- est_beta_params(mu, var)
  mapply(rbeta, n = 1, shape1 = bp$alpha, shape2 = bp$beta)
}

