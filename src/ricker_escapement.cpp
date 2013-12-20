#include <Rcpp.h>
using namespace Rcpp;

// Assign a salmon escapement target based on a Ricker curve

// [[Rcpp::export]]

double ricker_escapement(double a, double b) {
   return b * (0.5 - 0.07 * a);
}
