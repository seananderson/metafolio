\name{metasim_base}
\alias{metasim_base}
\title{Base-level metapopulation simulation function}
\usage{
metasim_base(n_pop, n_t, spawners_0, b, epsilon_mat, A_params, add_straying,
  stray_mat, assess_years, r_escp_goals, sigma_impl, add_impl_error)
}
\description{
This is an Rcpp implementation of the main simulation. It
is meant to be called by \code{\link{meta_sim}}.
}

