#' Ricker stock-recruit function with specified error
#' 
#' @param spawners Spawner abundance
#' @param a Ricker productivity paramater. Recruits are e^a at the origin.
#' @param b Ricker density dependent parameter.
#' @param v_t Residual on the curve. Will be exponentiated.
#' @export
#' @examples
#' x <- seq(1, 100)
#' v_t <- as.numeric(arima.sim(n = 100, model = list(ar = 0.3), sd = 0.1, mean = 0))
#' plot(x, ricker_v_t(spawners = x, a = 1.1, b = 60, v_t))
#ricker_v_t <- function(spawners, a, b, v_t) {
  #spawners * exp(a * (1 - spawners / b) + v_t)
#}

ricker_v_t <- function(spawners, a, b, d, v_t) {
  spawners^d * exp(a * (1 - spawners^d / b) + v_t)
}

