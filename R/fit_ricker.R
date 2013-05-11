#' Fit a Ricker curve
#'
#' @param S Spawners
#' @param R Recruits or returns

#' @examples
#' S <- seq(100, 1000, length.out = 25)
#' R <- sapply(S, function(x) ricker_ar1(spawners = x, a = 1.9, b =
#' 900, sigma_sq_v = 0.01)$recruits)
#' plot(S, log(R/S))
#' @export

fit_ricker <- function(S, R) {
  m <- lm(log(R/S) ~ S)
  m.coef <- coef(m)
  a <- as.numeric(m.coef[1])
  b <- -as.numeric(a/m.coef[2])
  return(list(a = a, b = b))
}

#' Fit a Ricker curve (quickly)
#'
#' This version uses \code{\link{stats::lm.fit}} by directly
#' specifying the model matrix. This is about an order of magnitude
#' faster than \code{\link{fit_ricker}}.
#'
#' @param S Spawners
#' @param R Recruits or returns
#' @export

fit_ricker_fast <- function(S, R) {
  m <- lm.fit(x = cbind(rep(1, length(S)), S), y = log(R/S))
  a <- m$coefficients[[1]]
  b <- -a/m$coefficients[[2]]
  return(list(a = a, b = b))
}

