#include <Rcpp.h>
using namespace Rcpp;
//' Create thermal tolerance curves (quickly using C++)
//'
//' Creates a quadratic thermal tolerance curve of the form:
//' width_param * (temp - optim_temp)^2 + max_a
//' Negative values are returned as 0.
//' This version uses C++ and about twice as fast as
//' \code{\link{thermal_curve_a}}
//' @param temp The input temperature value.
//' @param optim_temp The optimal temperature.
//' @param max_a The maximum productivity parameter `a` from a Ricker
//' model (or whatever the y-axis value is you want to return).
//' @param width_param A parameter to control the width of the
//' parabola. Smaller numbers make wider parabolas.
//' @return A productivity parameter given the location on a thermal
//' tolerance curve.
//' @export
//'
//' @useDynLib metafolio
// [[Rcpp::export]]
double thermal_curve_a_fast(double temp, double optim_temp = 15,
    double max_a = 1.4, double width_param = 0.02) {
  double a = -width_param * pow(temp - optim_temp, 2.0) + max_a;
  if (a > 0) {
    return a;
  } else {
    return 0;
  }
}
