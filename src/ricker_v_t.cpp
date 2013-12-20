#include <Rcpp.h>
using namespace Rcpp;

// Ricker stock-recruit function with specified error

// [[Rcpp::export]]
double ricker_v_t(double spawners, double a, double b, double d, double v_t) {
  return pow(spawners, d) * exp(a * (1 - pow(spawners, d) / b) + v_t);
}
