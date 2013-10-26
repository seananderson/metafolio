#' Ricker stock-recruit function with specified error
#'
#' @param spawners Spawner abundance
#' @param a Ricker productivity parameter. Recruits are e^a at the origin.
#' @param b Ricker density dependent parameter.
#' @param d Depensation parameter. A value of 1 means no depensation.
#' Larger values indicate depensation.
#' @param v_t Residual on the curve. Will be exponentiated. Note that
#' we are *not* bias correcting within this function (subtracting half
#' the variance squared) and so the deviations will not be mean
#' unbiased unless they were bias corrected previously.
#' @return Returns a vector of recruits.
#' @export
#' @examples
#' x <- seq(1, 100)
#' v_t <- as.numeric(arima.sim(n = 100, model = list(ar = 0.3), sd =
#'     0.1, mean = 0))
#' plot(x, ricker_v_t(spawners = x, a = 1.1, b = 60, d = 1, v_t), xlab =
#'   "Spawners", ylab = "Returns")

ricker_v_t <- function(spawners, a, b, d, v_t) {
  spawners^d * exp(a * (1 - spawners^d / b) + v_t)
}
