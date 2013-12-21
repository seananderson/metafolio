// [[Rcpp::depends(RcppArmadillo)]]
#include <RcppArmadillo.h>
using namespace Rcpp;

//' Estimate beta params
//'
// [[Rcpp::export]]
NumericVector est_beta_params(double mu, double var) {
  double alpha = ((1 - mu) / var - 1 / mu) * pow(mu, 2);
  double beta = alpha * (1 / mu - 1);
  NumericVector out(2);
  out(0) = alpha;
  out(1) = beta;
  return out;
}

//' Implementation error
//'
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
    out(i) = as<double>(Rcpp::rbeta(1, bp(i, 0), bp(i, 1)));
  }
  return out;
}

//' Ricker stock-recruit function with specified error
//'
// [[Rcpp::export]]
double ricker_v_t(double spawners, double a, double b, double d, double v_t) {
  return pow(spawners, d) * exp(a * (1 - pow(spawners, d) / b) + v_t);
}

//' Is element
//'
// [[Rcpp::export]]
bool is_element(int x, NumericVector y){
  int check = 0;
  for ( int i=0; i<y.size(); i++) {
    if (x == y(i)) {
      check += 1;
    }
  }
  if (check > 0) {
    return TRUE;
  } else {
    return FALSE;
  }
}

//' Super fast linear regression
//'
// [[Rcpp::export]]
arma::colvec fastlm(NumericVector yr, NumericMatrix Xr) {
  // see http://gallery.rcpp.org/articles/fast-linear-model-with-armadillo/
  int n = Xr.nrow(), k = Xr.ncol();
  arma::mat X(Xr.begin(), n, k, false);
  arma::colvec y(yr.begin(), yr.size(), false);
  arma::colvec coef = arma::solve(X, y);
  return coef;
}

//' Fit Ricker linear regression
//'
// [[Rcpp::export]]
NumericVector fit_ricker(NumericVector S, NumericVector R) {
  NumericMatrix Xr(S.size(), 2);
  // intercept:
  for (int i = 0; i < S.size(); ++i) {
    Xr(i,0) = 1;
  }
  Xr(_,1) = S;
  arma::colvec lmout = fastlm(log(R/S), Xr);
  NumericVector rickerout(2);
  rickerout(0) = lmout(0);
  rickerout(1) = -1 * lmout(0)/lmout(1);
  return rickerout;
}

//' Assign a salmon escapement target based on a Ricker curve
//'
// [[Rcpp::export]]
double ricker_escapement(double a, double b) {
  return b * (0.5 - 0.07 * a);
}

//' Main Rcpp function
//'
//' @export
// [[Rcpp::export]]
List metasim_base(
    int n_pop,
    int n_t,
    NumericVector spawners_0,
    NumericVector b,
    NumericMatrix epsilon_mat,
    NumericMatrix A_params,
    bool add_straying,
    NumericMatrix stray_mat,
    NumericVector assess_years,
    NumericMatrix r_escp_goals
    ) {

  //bool add_impl_error,

  // TODO assess_years is used now not assess_freq
  // this also affects start_assessment

  NumericMatrix A(n_t, n_pop); // total abundance (say returns)
  NumericMatrix F(n_t, n_pop); // fisheries catch
  NumericMatrix E(n_t, n_pop); // escapement
  NumericMatrix Strays_leaving(n_t, n_pop);
  NumericMatrix Strays_joining(n_t, n_pop);
  NumericMatrix Est_a(n_t, n_pop);
  NumericMatrix Est_b(n_t, n_pop);
  NumericMatrix to_reallocate(n_pop, n_pop);

  // Set up initial years:
  A(0, _) = spawners_0; // first year
  E(0, _) = spawners_0; // first year

  // Run the simulation through time:
  for (int i = 1; i < n_t; ++i) { // start on second year
    for (int j = 0; j < n_pop; ++j) {
      // spawner-recruit:
      A(i, j) = ricker_v_t(E(i-1, j), A_params(i, j), b(j),
          1.00, epsilon_mat(i, j));  // note depensation hard coded
      //if (A(i,j) < 0) warning("Abundance before straying or harvesting was < 0.")
    }
    // now we have the returns for this year, let's allocate straying:

    if (add_straying) {
      for (int j = 0; j < n_pop; ++j) {
        for (int k = 0; k < n_pop; ++k) {
          // from column to row populations:
          to_reallocate(k, j) = stray_mat(k, j) * A(i, j);
        }
      }
      double to_subtract, to_add;
      for (int j = 0; j < n_pop; ++j) {
        to_add = sum(to_reallocate(j,_)); // row sum
        to_subtract = sum(to_reallocate(_,j)); // column sum

        //for (int k = 0; k < n_pop; ++k) {
        Strays_leaving(i,j) = to_subtract;
        Strays_joining(i,j) = to_add;
        A(i,j) = A(i,j) - to_subtract + to_add;
        //}
      }
    } // done adding straying


    // Fit recent data to get estimated a and b values,
    // set escapement based on these.
    // Random fishery for first X years, establish S-R data to work with:
    NumericVector escapement_goals(n_pop);
    if (i < min(assess_years - 2)) {
      escapement_goals = A(i,_) * r_escp_goals(i,_);
    }
    // in first year, start at true b
    if (i == min(assess_years - 2)) {
      Est_b(i, _) = b;
      escapement_goals = A(i,_) * r_escp_goals(i,_);
    }
    // otherwise, we need to assess or use the last assessment
    if (i >= min(assess_years - 1)) {
      if (is_element(i, assess_years - 1)) {
        for (int j = 0; j < n_pop; ++j) {
          NumericVector recruits(i-2), spawners(i-2);
          for (int k = 2; k < i; ++k) { // R and S up to now
            recruits(k-2) = A(k, j); // A(2:i, j); TODO check this is correct
            spawners(k-2) = E(k-1, j); // E(1:(i - 1), j)
          }
          NumericVector rick;
          rick = fit_ricker(spawners, recruits);
          Est_a(i,j) = rick(0);
          Est_b(i,j) = rick(1);


          // sanity bounds:
          if (Est_b(i,j) > 1.5 * Est_b(i-1,j)) {
            Est_b(i,j) = 1.5 * Est_b(i-1,j);
          }
          if (Est_b(i,j) < 0.5 * Est_b(i-1,j)) {
            Est_b(i,j) = 0.5 * Est_b(i-1,j);
          }
          if (Est_a(i,j) < 0.02) {
            Rcout << "Warning, a was too small" << std::endl;
            Est_a(i,j) = 0.02;
          }
          if (Est_a(i,j) > 4) {
            Est_a(i,j) = 4;
          }

        }
        for (int k = 0; k < n_pop; ++k) {
          escapement_goals(k) = ricker_escapement(Est_a(i,k),Est_b(i,k));
        }
      } else { // no assessment; take last value
        //Rcout << "Using last a and b value for i = " << i << std::endl;
        Est_a(i,_)=Est_a(i-1,_);
        Est_b(i,_)=Est_b(i-1,_);
        for (int k = 0; k < n_pop; ++k) {
          escapement_goals(k) = ricker_escapement(Est_a(i-1,k),Est_b(i-1,k));
        }
      }
    }
    F(i,_) = A(i,_) - escapement_goals; // catch to leave escapement behind
    for (int k = 0; k < n_pop; ++k) {
      if (F(i, k) < 0) {
        F(i, k) = 0;
      }
    }

    E(i,_) = A(i,_) - F(i,_); // escapement
  }
  return List::create(Named("A") = A,
      Named("E") = E,
      Named("F") = F,
      Named("Strays_leaving") = Strays_leaving,
      Named("Strays_joining") = Strays_joining,
      Named("stray_mat") = stray_mat,
      Named("n_pop") = n_pop,
      Named("n_t") = n_t,
      Named("Est_a") = Est_a,
      Named("A_params") = A_params,
      Named("Eps") = epsilon_mat,
      Named("Est_b") = Est_b);
}

