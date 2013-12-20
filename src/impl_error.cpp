#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector est_beta_params(double mu, double var) {
  double alpha = ((1 - mu) / var - 1 / mu) * pow(mu, 2);
  double beta = alpha * (1 / mu - 1);
  
  NumericVector out(2);
  out(0) = alpha;
  out(1) = beta;
  
  return out;
}

// [[Rcpp::export]]
NumericVector impl_error(NumericVector mu, double sigma_impl) {
  int n = mu.size();
  NumericMatrix bp(n, 2);
  
  //if(max(mu) > 1 | min(mu) < 0) stop("mu must be between 0 and 1")
  
  double var = pow(sigma_impl, 2);
  
  for (int i = 0; i < n; ++i) {
    bp(i, _) = est_beta_params(mu(i), var);
  }
  
  NumericVector out(n);
  for (int i = 0; i < n; ++i) {
    // Rcpp::Rcout << Rcpp::rbeta(n, bp(i, 0), bp(i, 1)) << std::endl;
    out(i) = as<double>(Rcpp::rbeta(1, bp(i, 0), bp(i, 1)));
  }    
  return out;
}
