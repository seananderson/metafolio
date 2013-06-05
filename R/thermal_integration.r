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

optim_thermal <- function(optim_temp, width_param) {
  optimize(thermal_area, desired_area = 30, optim_temp = optim_temp,
    width_param = width_param, interval = c(0, 5))$minimum
}

#' Get maximum Ricker a values for a given number of populations
#'
#' @param n_pop The number of populations
#' @export
thermal_integration <- function(n_pop, width_params = c(seq(0.05,
      0.02, length.out = n_pop/2), rev(seq(0.05, 0.02, length.out =
        n_pop/2))), optim_temps = seq(13, 19, length.out = n_pop)) {
  if(n_pop %% 2 != 0) stop("n_pop must be an even number")
  mapply(optim_thermal, optim_temps, width_params)
}

