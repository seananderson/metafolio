#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
List metasim_base = function(
  int n_pop,
  int n_t,
  int spawners_0,
  NumericMatrix r_escp_goals,
  NumericMatrix epsilon_mat,
  NumericMatrix stray_mat,
  NumericVector A_params,
  NumericVector assess_years) {

   // Note TODO assess_years is used now not assess_freq
   // this also affects start_assessment

  NumericMatrix A(n_t, n_pop); // total abundance (say returns)
  NumericMatrix F(n_t, n_pop); // fisheries catch
  NumericMatrix E(n_t, n_pop); // escapement
  NumericMatrix Eps(n_t, n_pop);p// S-R residuals, for AR1 tracking
  NumericMatrix Strays_leaving(n_t, n_pop);
  NumericMatrix Strays_joining(n_t, n_pop);
  NumericMatrix Est_a(n_t, n_pop);
  NumericMatrix Est_b(n_t, n_pop);

  // Set up initial years:
  A[0, _] = spawners_0; // first year
  E[0, _] = spawners_0; // first year

  for (int k = 1; k < n_pop; ++k) {
    Eps[0, k] = 0; // first year
  }

  // Run the simulation through time:
  for (int i = 1; i < n_t; ++i) { // start on second year
    for (int j = 0; j < n_pop; ++j) {
      // spawner-recruit section:
      A[i, j] = ricker_v_t(spawners = E[i-1, j], a = A_params[i, j],
        b = b[j], v_t = epsilon_mat[i, j], d = 1.00);  // note depensation hard coded
      //if (A[i,j] < 0) warning("Abundance before straying or harvesting was < 0.")
    }
    // now we have the returns for this year, let's allocate straying:
    if (add_straying) {
      matrix to_reallocate(n_pop, n_pop);
      for(j in 1:n_pop) {
        // from column to row populations:
        to_reallocate[j, ] = stray_mat[j, ] * A[i, j];
      }
      to_subtract = rowSums(to_reallocate);
      to_add = colSums(to_reallocate);
      Strays_leaving[i, ] = to_subtract;
      Strays_joining[i, ] = to_add;
      A[i, ] = A[i, ] - to_subtract + to_add;
    }
    // Fit recent data to get estimated a and b values,
    // set escapement based on these.
    // Random fishery for first X years, establish S-R data to work with:
    if (i < start_assessment) escapement_goals = A[i, ] * r_escp_goals[i, ]
    // sanity check - make sure estimate isn't too far from this:
    if (i == (start_assessment - 1)) Est_b[i, ] = b
    if (i >= start_assessment) {
      // every nth year, re-assess a and b:
      if ((i - start_assessment)%%assess_freq == 0) {
        for(j in 1:n_pop) {
          recruits = A[3:i, j];
          spawners = E[2:(i - 1), j];
          rick = fit_ricker(R = recruits, S = spawners)
          // TODO implement bounds for sanity here
          Est_a[i,j]=rick$a;
          Est_b[i,j]=rick$b;
        }
        escapement_goals = ricker_escapement(Est_a[i,],Est_b[i,])
      } else { // no assessment
        Est_a[i,]=Est_a[i-1,];
        Est_b[i,]=Est_b[i-1,];
        // no assessment, use last year's values
        escapement_goals = ricker_escapement(Est_a[i-1,],Est_b[i-1,]);
      }
    }
    if (add_impl_error) {
      escapement_goals_fraction = escapement_goals / A[i,];
      // avoid rbeta errors if fraction too big
      // would have got reduced below anyways
      escapement_goals_fraction[escapement_goals_fraction > .95] = .95;
      escapement_goals_fraction_w_error =  impl_error(mu =
        escapement_goals_fraction, sigma_impl = sigma_impl);
      escapement_goals = escapement_goals_fraction_w_error * A[i,];
    }
    F[i, ] = A[i, ] - escapement_goals // catch to leave escapement behind
    negative_F = which(F[i, ] < 0)
    F[i, negative_F] = 0;
    E[i, ] = A[i, ] - F[i, ]; // escapement
  }
  return List(Named("A") = A,
              Named("F") = F,
              Named("E") = E,
              Named("Eps") = epsilon_mat,
              Named("A_params") = A_params,
              Named("Strays_leaving") = Strays_leaving,
              Named("Strays_joining") = Strays_joining,
              Named("env_ts") = env_ts,
              Named("stray_mat") = stray_mat,
              Named("n_pop") = n_pop,
              Named("n_t") = n_t,
              Named("b") = b,
              Named("Est_a") = Est_a,
              Named("Est_b") = Est_b)
}
