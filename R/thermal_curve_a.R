#' Create thermal tolerance curves. 
#'
#' Creates a quadratic thermal tolerance curve of the form:
#' width_param * (temp - optim_temp)^2 + max_a
#' Negative values are returned as 0.
#'
#' @param temp The input temperature value.
#' @param optim_temp The optimal temperature.
#' @param max_a The maximum productivity parameter `a` from a Ricker
#' model (or whatever the y-axis value is you want to return).
#' @param width_param A parameter to control the width of the
#' parabola. Smaller numbers make wider parabolas.
#' @return A productivity parameter given the location on a thermal
#' tolerance curve.
#' @export
#' @examples
#' x <- seq(5, 30, length.out = 200)
#' plot(x, thermal_curve_a(x), ylab = "a", xlab = "Temperature", type
#' = "l")
# For the C++ version:
#' @useDynLib mypackage

thermal_curve_a <- function(temp, optim_temp = 15, max_a = 1.4, width_param = 0.02) {
  a <- -width_param * (temp - optim_temp)^2 + max_a
  #return(ifelse(a < 0, 0, a))
  a
}

# Create thermal tolerance curves; with C++
#
# Creates a quadratic thermal tolerance curve of the form:
# width_param * (temp - optim_temp)^2 + max_a
# Negative values are returned as 0.
# This version uses C++ and is 2-3 times faster than
# \code{\link{thermal_curve_a}}
# @param temp The input temperature value.
# @param optim_temp The optimal temperature.
# @param max_a The maximum productivity parameter `a` from a Ricker
# model (or whatever the y-axis value is you want to return).
# @param width_param A parameter to control the width of the
# parabola. Smaller numbers make wider parabolas.
# @return A productivity parameter given the location on a thermal
# tolerance curve.
# @examples
# x <- seq(5, 30, length.out = 200)
# plot(x, thermal_curve_a(x), ylab = "a", xlab = "Temperature", type
# = "l")
# @export

#cppFunction('
  #double thermal_curve_a_rcpp(double temp, double optim_temp = 15, double max_a = 1.4, double width_param = 0.02) {
    #double a = -width_param * pow(temp - optim_temp, 2.0) + max_a;
    #if (a > 0) {
      #return a;
    #} else {
      #return 0;
    #}
  #}'
#)

