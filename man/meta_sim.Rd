\name{meta_sim}
\alias{meta_sim}
\title{Run a (salmon) metapopulation simulation.}
\usage{
  meta_sim(n_t = 120, n_pop = 10, stray_decay_rate = 0.3,
    stray_fraction = 0.01, b = rep(1000, n_pop),
    spawners_0 = round(b), sigma_v = 0.1, v_rho = 0.4,
    a_width_param = rep(0.02, n_pop),
    optim_temp = seq(13, 19, length.out = n_pop),
    max_a = rep(1.4, n_pop),
    env_type = c("sine", "arma", "regime", "linear", "constant"),
    env_params = list(amplitude = 2, ang_frequency = 0.2, phase = 0, mean_value = 16),
    use_cache = FALSE, add_straying = TRUE)
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

  \item{use_cache}{Use the stochastically generated values
  (SR residuals and possibly environmental time series)
  from the previous run?}

  \item{add_straying}{Implement straying between
  (sub)populations?}
}
\description{
  Run a (salmon) metapopulation simulation.
}

