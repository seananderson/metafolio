#include <Rcpp.h>
using namespace Rcpp;
//' Ricker stock-recruit function with specified error (with Rcpp)
//'
//' @useDynLib metafolio
// [[Rcpp::export]]
double ricker_v_t_fast(double spawners, double a,
    double b, double d, double v_t) {
  double x = pow(spawners, d) * exp(a * (1 - pow(spawners, d) / b) + v_t);
  return x;
}
