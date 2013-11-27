#' Return desired squared deviation between desired area and actual
#' area under a curve
thermal_area <- function(max_a, desired_area, optim_temp, width_param,
  lower = -5, upper = 40) {

  root.l <- uniroot(thermal_curve_a, optim_temp = optim_temp, max_a =
    max_a, width_param = width_param, lower = lower, upper =
    optim_temp)$root
  root.u <- uniroot(thermal_curve_a, optim_temp = optim_temp, max_a =
    max_a, width_param = width_param, lower = optim_temp, upper =
    upper)$root

  int <- integrate(thermal_curve_a, optim_temp = optim_temp, max_a =
    max_a, width_param = width_param, lower = root.l, upper = root.u,
    subdivisions = 300L)

  (desired_area - int$value)^2
}

#' Optimize to find optimal max a
optim_thermal <- function(optim_temp, width_param, desired_area) {
  optimize(thermal_area, desired_area, optim_temp = optim_temp,
    width_param = width_param, interval = c(0, 5))$minimum
}

#' Integrate thermal tolerance curves to get maximum Ricker a values
#'
#' Get maximum Ricker a values for a given number of populations. Useful for
#' assembling multiple thermal tolerance curves in which each has the same total
#' area under it.
#'
#' @param n_pop The number of populations.
#' @param width_params Desired widths of the thermal tolerance curves.
#' @param optim_temps Temperature value at which to reach the peak of each
#'   thermal tolerance curve.
#' @param desired_area Desired area under each curve.
#' @export
#' @examples
#' # Minimal example:
#' thermal_integration(16)
#'
#' # Elaborate example:
#' optim_temps <- seq(13, 19, length.out = 10)
#' widths <- c(seq(0.05, 0.02, length.out = 5), rev(seq(0.05, 0.02,
#'       length.out = 5)))
#' heights <- c(seq(2.8, 2.2, length.out = 5), rev(seq(2.8, 2.2,
#'       length.out = 5)))
#' x <- seq(3, 29, length.out = 200)
#' plot(1, 1, xlim = c(4, 28), ylim = c(-0.01, 2.9), ylab = "Ricker
#'   productivity parameter (a)", xlab = "Environmental value", type =
#'   "n", yaxs = "i", las = 1)
#' for(i in 1:10) {
#'   a <- thermal_curve_a(x, optim_temp = optim_temps[i], max_a =
#'     heights[i], width_param = widths[i])
#'   lines(x, a, col = "grey40", lwd = 1.5)
#' }

thermal_integration <- function(n_pop, width_params = c(seq(0.05,
      0.02, length.out = n_pop/2), rev(seq(0.05, 0.02, length.out =
        n_pop/2))), optim_temps = seq(13, 19, length.out = n_pop),
  desired_area = 30) {
  if (n_pop %% 2 != 0) {
    stop("n_pop must be an even number")
  }
  mapply(optim_thermal, optim_temps, width_params, desired_area)
}
