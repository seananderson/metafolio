// [[Rcpp::depends(RcppArmadillo)]]
#include <RcppArmadillo.h>
using namespace Rcpp;

// [[Rcpp::export]]
arma::colvec fastlm(NumericVector yr, NumericMatrix Xr) {
  // see http://gallery.rcpp.org/articles/fast-linear-model-with-armadillo/
  int n = Xr.nrow(), k = Xr.ncol();
  arma::mat X(Xr.begin(), n, k, false);
  arma::colvec y(yr.begin(), yr.size(), false);
  arma::colvec coef = arma::solve(X, y);
  return coef;
}

// Fit Ricker linear regression

// [[Rcpp::export]]
List fit_ricker(NumericVector S, NumericVector R) {
  NumericMatrix Xr(S.size(), 2);
  // intercept:
  for (int i = 0; i < S.size(); ++i) {
    Xr(i,0) = 1;
  }
  Xr(_,1) = S;
  arma::colvec lmout = fastlm(log(R/S), Xr);
  return List::create(Named("a") = lmout(0), Named("b") = lmout(1));
}
