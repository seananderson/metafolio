\name{meta_sim}
\alias{meta_sim}
\title{Run a (salmon) metapopulation simulation.}
\usage{
  meta_sim(n_t = 100, n_pop = 10, stray_decay_rate = 0.3,
    stray_fraction = 0.01, b = rep(1000, n_pop),
    spawners_0 = round(b), sigma_v = 0.3, v_rho = 0.4,
    a_width_param = c(seq(0.05, 0.02, length.out = n_pop/2), rev(seq(0.05, 0.02, length.out = n_pop/2))),
    optim_temp = seq(13, 19, length.out = n_pop),
    max_a = thermal_integration(n_pop),
    env_type = c("sine", "arma", "regime", "linear", "constant"),
    env_params = list(amplitude = 3.2, ang_frequency = 0.2, phase = runif(1, -pi, pi), mean_value = 15, slope = 0, sigma_env = 0.3),
    start_assessment = 20, assessment_window = 25,
    sigma_impl = 0.05, assess_freq = 10, use_cache = FALSE,
    cache_env = FALSE, add_straying = TRUE,
    add_impl_error = TRUE)
}
\arguments{
  \item{n_t}{The number of years.}

  \item{n_pop}{Number of (sub)populations}

  \item{stray_decay_rate}{Rate that straying
  (exponentially) decays with distance.}

  \item{stray_fraction}{Fraction of fish that stray from
  natal streams.}

  \item{b}{Ricker density-dependent parameter. Should be
  one per (sub)population.}

  \item{spawners_0}{A vector of spawner abundances at the
  start of the simulation. Length of the vector should
  equal the number of subpopulations.}

  \item{sigma_v}{Stock-recruit residual standard deviation.
  Will be exponentiated.}

  \item{v_rho}{AR1 serial correlation of stock-recruit
  residuals.}

  \item{a_width_param}{Width of the thermal curves by
  (sub)population.}

  \item{optim_temp}{Optimal temperatures by
  (sub)population.}

  \item{max_a}{Maximum Ricker productivity parameters (a)
  by (sub)population. The value obtained at the optimum
  temperature.m}

  \item{env_type}{The type of environmental time series to
  generate.  One of "sine", "arma", "regime", "linear", or
  "constant".}

  \item{env_params}{Parameters to pass on to
  \code{generate_env_ts}. You must provide the appropriate
  list given your chosen type of environmental signal.}

  \item{start_assessment}{Generation to start estimating SR
  relationship for escapement targets}

  \item{assessment_window}{Number of generations to use
  when fitting SR relationship for escapement targets; must
  be bigger than start_assessment}

  \item{sigma_impl}{implementation sd for beta
  distribution}

  \item{assess_freq}{How many generations before
  re-assessing a and b parameters.}

  \item{use_cache}{Use the stochastically generated values
  (SR residuals and possibly environmental time series)
  from the previous run?}

  \item{add_straying}{Implement straying between
  (sub)populations?}

  \item{add_impl_error}{Add implementation error?}
}
\description{
  Run a (salmon) metapopulation simulation.
}

