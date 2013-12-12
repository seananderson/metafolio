\name{meta_sim}
\alias{meta_sim}
\title{Run a single (salmon) metapopulation simulation.}
\usage{
meta_sim(n_t = 100, n_pop = 10, stray_decay_rate = 0.3,
  stray_fraction = 0.01, b = rep(1000, n_pop), spawners_0 = round(b),
  sigma_v = 0.3, v_rho = 0.4, a_width_param = c(seq(0.05, 0.02, length.out
  = n_pop/2), rev(seq(0.05, 0.02, length.out = n_pop/2))),
  optim_temp = seq(13, 19, length.out = n_pop),
  max_a = thermal_integration(n_pop), env_type = c("sine", "arma", "regime",
  "linear", "constant"), env_params = list(amplitude = 3.2, ang_frequency =
  0.2, phase = runif(1, -pi, pi), mean_value = 15, slope = 0, sigma_env = 0.3),
  start_assessment = 20, assessment_window = 25, a_lim = c(0.02, 4),
  b_lim = c(0.5, 1.5), silence_warnings = TRUE, sigma_impl = 0.05,
  assess_freq = 10, use_cache = FALSE, cache_env = FALSE,
  add_straying = TRUE, add_impl_error = TRUE)
}
\arguments{
  \item{n_t}{The number of years.}

  \item{n_pop}{Number of populations}

  \item{stray_decay_rate}{Rate that straying
  (exponentially) decays with distance.}

  \item{stray_fraction}{Fraction of fish that stray from
  natal streams.}

  \item{b}{Ricker density-dependent parameter. A vector
  with one numeric value per population.}

  \item{spawners_0}{A vector of spawner abundances at the
  start of the simulation. Length of the vector should
  equal the number of populations.}

  \item{sigma_v}{Stock-recruit residual standard deviation
  of the log-deviations.}

  \item{v_rho}{AR1 serial correlation of stock-recruit
  residuals.}

  \item{a_width_param}{Width of the thermal curves by
  population.}

  \item{optim_temp}{Optimal temperatures by population.}

  \item{max_a}{Maximum Ricker productivity parameters (a)
  by population.  The value obtained at the optimum
  temperature. Note how the default argument uses the
  \code{\link{thermal_integration}} function.}

  \item{env_type}{The type of environmental time series to
  generate. One of \code{"sine"}, \code{"arma"},
  \code{"regime"}, \code{"linear"}, or \code{"constant"}.
  See \code{\link{generate_env_ts}}.}

  \item{env_params}{Parameters to pass on to
  \code{\link{generate_env_ts}}.  You must provide the
  appropriate list given your chosen type of environmental
  signal.}

  \item{start_assessment}{Generation to start estimating
  the stock recruit relationship for escapement targets.
  The assessment is carried out using
  \code{\link{fit_ricker}}.}

  \item{assessment_window}{Number of generations to use
  when fitting fitting the stock-recruit relationship for
  escapement targets; must be bigger than
  \code{start_assessment}.}

  \item{a_lim}{A vector of length two giving the lower and
  upper limits for Ricker a values. If a value is estimated
  beyond these limits it will be set to the limit value.}

  \item{b_lim}{A vector of length two giving the lower and
  upper limits for the estimated Ricker b values *as
  fractions* of the previously assessed value. If a value
  is estimated beyond these limits it will be set to the
  limit value.}

  \item{silence_warnings}{Should the warnings be skipped if
  the Ricker a or b values exceed their specified bounds?
  \code{meta_sim} will still print other warnings
  regardless of this argument value.}

  \item{sigma_impl}{Implementation standard deviation for
  the implementation error beta distribution.}

  \item{assess_freq}{How many generations before
  re-assessing Ricker a and b parameters.}

  \item{use_cache}{Use the stochastically generated values
  (stock-recruit residuals and possibly environmental time
  series) from the previous run?  See the Details section
  below.}

  \item{cache_env}{Logical: Should the environmental time
  series be cached? If \code{use_cache = TRUE} then this
  will automatically happen. But, you could set
  \code{cache_env = TRUE} and \code{use_cache = FALSE} to
  only cache the environmental time series. See the Details
  section below.}

  \item{add_straying}{Implement straying between
  populations?}

  \item{add_impl_error}{Add implementation error?
  Implementation error is derived using
  \code{\link{impl_error}}.}
}
\value{
A list is returned that contains the following elements.
All matrices that are returned (except the straying matrix)
feature populations along the columns and generations/years
along the rows. \describe{ \item{\code{A}}{A matrix of
abundances.} \item{\code{F}}{A matrix of fishing mortality
in numbers.} \item{\code{E}}{A matrix of realized
escapement.} \item{\code{Eps}}{A matrix of (log)
spawner-return residuals. These have been log-normal bias
corrected so their expected value after exponentiation will
be one.} \item{\code{A_params}}{A matrix of actual Ricker a
parameters.} \item{\code{Strays_leaving}}{A matrix of
strays leaving.} \item{\code{Strays_joining}}{A matrix of
strays joining.} \item{\code{env_ts}}{A vector of the
environmental time series.} \item{\code{stray_mat}}{The
straying matrix. These fractions are constant across
generations/years. Rows and columns are populations.}
\item{\code{n_pop}}{The total possible populations as input
in the simulation.} \item{\code{n_t}}{The number of
generations/years the simulation was run for.}
\item{\code{b}}{The original Ricker b values as specified.}
\item{\code{Est_a}}{A matrix of estimated Ricker a values.}
\item{\code{Est_b}}{A matrix of estimated Ricker b values.}
}
}
\description{
This is the master function for running \pkg{metafolio}
simulations. It runs a single iteration of a simulation.
The arguments can be manipulated with other functions in
the package to use this function as part of a portfolio
analysis.
}
\details{
To use either of the caching options, you must have run
\code{meta_sim} at least once in the current session with
both caching arguments set to \code{FALSE} to generate the
cached values first. If you're running many iterations of
\code{meta_sim} and you want to cache, then the first
iteration should have both cache arguments set to
\code{FALSE}, and subsequent runs can set one or both to
\code{TRUE}. Internally, \code{meta_sim} caches by writing
the appropriate data to a \code{.rda} file in a temporary
directory as created by the function
\code{\link[base]{tempdir}}.
}
\examples{
arma_env_params <- list(mean_value = 16, ar = 0.1, sigma_env = 2, ma = 0)
base1 <- meta_sim(n_pop = 10, env_params = arma_env_params,
  env_type = "arma", assess_freq = 5)

plot_sim_ts(base1, years_to_show = 70, burn = 30)
}

