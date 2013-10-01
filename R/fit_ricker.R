#' Fit a Ricker curve (quickly)
#'
#' Fit a Ricker curve to spawner-recruit data and return the intercept
#' (a) and slope (b). This function uses \code{\link{lm.fit()}} by
#' directly specifying the model matrix. This is about an order of
#' magnitude faster than \code{lm()}.
#'
#' @param S Spawners as a numeric vector.
#' @param R Recruits or returns as a numeric vector.
#' @export
#' @return
#' A named list with components \code{a} for the intercept and
#' \code{b} for the slope.
#' @examples
#' S <- seq(100, 1000, length.out = 100)
#' v_t <- rnorm(100, 0, 0.1)
#' R <- ricker_v_t(spawners = S, a = 1.9, b = 900, d = 1, v_t)
#' plot(S, log(R/S))
#' fit_ricker(S, R)

fit_ricker <- function(S, R) {
  m <- lm.fit(x = cbind(rep(1, length(S)), S), y = log(R/S))
  a <- m$coefficients[[1]]
  b <- -a/m$coefficients[[2]]
  return(list(a = a, b = b))
}
