#' Run a (salmon) metapopulation simulation.
#'
#' @param n_t The number of years.
#' @param n_pop Number of (sub)populations
#' @param stray_decay_rate Rate that straying (exponentially) decays with
#'   distance.
#' @param stray_fraction Fraction of fish that stray from natal streams.
#' @param b Ricker density-dependent parameter. Should be one per
#'   (sub)population.
#' @param spawners_0 A vector of spawner abundances at the start of the
#'   simulation. Length of the vector should equal the number of
#'   subpopulations.
#' @param sigma_v Stock-recruit residual standard deviation. Will be
#'   exponentiated.
#' @param v_rho AR1 serial correlation of stock-recruit residuals.
#' @param a_width_param Width of the thermal curves by (sub)population.
#' @param optim_temp Optimal temperatures by (sub)population.
#' @param max_a Maximum Ricker productivity parameters (a) by (sub)population.
#'   The value obtained at the optimum temperature.
#' @param env_type The type of environmental time series to generate. One of
#'   "sine", "arma", "regime", "linear", or "constant".
#' @param env_params Parameters to pass on to \code{\link{generate_env_ts}}.
#'   You must provide the appropriate list given your chosen type of
#'   environmental signal.
#' @param start_assessment Generation to start estimating SR relationship for
#'   escapement targets
#' @param assessment_window Number of generations to use when fitting SR
#'   relationship for escapement targets; must be bigger than start_assessment
#' @param sigma_impl implementation sd for beta distribution
#' @param assess_freq How many generations before re-assessing a and b
#'   parameters.
#' @param use_cache Use the stochastically generated values (SR residuals and
#'   possibly environmental time series) from the previous run? See the Details
#'   section below.
#' @param cache_env Logical: Should the environmental time series be cached? If
#'   \code{use_cache = TRUE} then this will automatically happen. But, you
#'   could set \code{cache_env = TRUE} and \code{use_cache = FALSE} to only
#'   cache the environmental time series. See the details section below.
#' @param add_straying Implement straying between (sub)populations?
#' @param add_impl_error Add implementation error?
#' @details
#' To use either of the caching options, you must have run \code{meta_sim} at
#' least once in the current session with both caching arguments set to
#' \code{FALSE} to generate the cached values first. If you're running many
#' iterations of \code{meta_sim} and you want to cache, then the first iteration
#' should have both cache arguments set to \code{FALSE}, and subsequent runs can
#' set one or both to \code{TRUE}. Internally, \code{meta_sim} caches by writing
#' the appropriate data to a \code{.rda} file in a temporary directory as
#' created by the function \code{\link[base]{tempdir}}.
#'
#' @export

meta_sim <- function(
  n_t = 100,
  n_pop = 10,
  stray_decay_rate = 0.3,
  stray_fraction = 0.01,
  b = rep(1000, n_pop),
  spawners_0 = round(b),
  sigma_v = 0.3,
  v_rho = 0.4,
  a_width_param = c(seq(0.05, 0.02, length.out = n_pop/2), rev(seq(0.05, 0.02,
        length.out = n_pop/2))),
  optim_temp = seq(13, 19, length.out = n_pop),
  max_a = thermal_integration(n_pop),
  env_type = c("sine", "arma", "regime", "linear", "constant"),
  env_params = list(amplitude = 3.2, ang_frequency = 0.2, phase = runif(1,
      -pi, pi), mean_value = 15, slope = 0, sigma_env = 0.30),
  start_assessment = 20,
  assessment_window = 25,
  sigma_impl = 0.05,
  assess_freq = 10,
  use_cache = FALSE,
  cache_env = FALSE,
  add_straying = TRUE,
  add_impl_error = TRUE
  ) {

  if (use_cache | cache_env) {
    load("env_ts.rda")
  } else {
    env_type <- env_type[1]
    env_ts <- switch(env_type,
      sine = generate_env_ts(n_t = n_t, type = "sine", sine_params =
        env_params),
      arma = generate_env_ts(n_t = n_t, type = "arma", arma_params =
        env_params),
      regime = generate_env_ts(n_t = n_t, type = "regime",
        regime_params = env_params),
      linear = generate_env_ts(n_t = n_t, type = "linear",
        linear_params = env_params),
      constant = generate_env_ts(n_t = n_t, type = "constant",
        constant_params = env_params)
      )
    save(env_ts, file = "env_ts.rda")
  }

  # create vectors and matrices that are not developed iteratively:
  if (use_cache) {
    load("sim_dat.rda")
  } else {

    # Figure out alpha parameters before running through the loops:
    A_params <- matrix(ncol = n_pop, nrow = n_t) # a parameters from Ricker
    for(j in 1:n_pop) {
      A_params[, j] <- thermal_curve_a(env_ts, optim_temp =
        optim_temp[j], max_a = max_a[j], width_param =
        a_width_param[j])
    }
    A_params[A_params<0] <- 0

    stray_mat <- generate_straying_matrix(n_pop = n_pop, stray_fraction
      = stray_fraction, stray_decay_rate = stray_decay_rate)

    epsilon_mat <- matrix(ncol = n_pop, nrow = n_t)
    epsilon_mat[1, ] <- rnorm(n_pop, mean = 0, sd = sigma_v)
    for(i in 2:n_t) {
      epsilon_mat[i, ] <- epsilon_mat[i - 1, ] * v_rho + rnorm(n_pop, mean =
        0 - (sigma_v^2)/2, sd = sigma_v) # stock-recruit residuals; note bias correction
    }
    # now develop random escapement targets at start of open access
    r_escp_goals <- matrix(nrow = start_assessment, ncol = n_pop, data =
      runif(n_pop*start_assessment, 0.1, 0.9))
    save(stray_mat, epsilon_mat, r_escp_goals, A_params, file = "sim_dat.rda")
  }

  # matrices to store output:
  A <- matrix(ncol = n_pop, nrow = n_t) # total abundance (say returns)
  F <- matrix(ncol = n_pop, nrow = n_t) # fisheries catch
  E <- matrix(ncol = n_pop, nrow = n_t) # escapement
  Eps <- matrix(ncol = n_pop, nrow = n_t) # S-R residuals, for AR1 tracking
  Strays_leaving <- matrix(ncol = n_pop, nrow = n_t)
  Strays_joining <- matrix(ncol = n_pop, nrow = n_t)
  Est_a <- matrix(ncol = n_pop, nrow = n_t)
  Est_b <- matrix(ncol = n_pop, nrow = n_t)

  A[1, ] <- spawners_0 # first year
  E[1, ] <- spawners_0 # first year
  Eps[1, ] <- rep(0, n_pop) # first year

  # run the simulation through time:
  for(i in 2:n_t){
    for(j in 1:n_pop) {
      # spawner-recruit section:
      A[i, j] <- ricker_v_t(spawners = E[i-1, j], a = A_params[i, j],
        b = b[j], v_t = epsilon_mat[i, j], d = 1.00)  # note depensation hard coded
      if (A[i,j] < 0) warning("Abundance before straying or harvesting was < 0.")
    }
    # now we have the returns for this year, let's allocate straying:
    if (add_straying) {
      to_reallocate <- matrix(ncol = n_pop, nrow = n_pop)
      for(j in 1:n_pop) {
        # from column to row populations:
        to_reallocate[j, ] <- stray_mat[j, ] * A[i, j]
      }
      to_subtract <- rowSums(to_reallocate)
      to_add <- colSums(to_reallocate)
      Strays_leaving[i, ] <- to_subtract
      Strays_joining[i, ] <- to_add
      A[i, ] <- A[i, ] - to_subtract + to_add
    }
    # harvesting:
    # setting escapement according to Hilborn and Walters p272
    # (pdf p139), Table 7.2: Smsy = b(0.5 - 0.07*a)

    # Fit recent data to get estimated a and b values, set escapement
    # based on these.
    # Random fishery for first X years, establish S-R data to work with:
    if (i < start_assessment) escapement_goals <- A[i, ] * r_escp_goals[i, ]
    # sanity check - make sure estimate isn't too far from this:
    if (i == (start_assessment - 1)) Est_b[i, ] <- b
    if (i >= start_assessment) {
      # every nth year, re-assess a and b:
      if ((i - start_assessment)%%assess_freq == 0) {
        for(j in 1:n_pop) {
          recruits <- A[3:i, j]
          spawners <- E[2:(i - 1), j]
          rick <- fit_ricker(R = recruits, S = spawners)
          # bounds for sanity:
          if (rick$a > 4) {
            warning("Ricker a was estimated at greater than 4. Setting to 4.")
            rick$a <- 4
          }
          if (rick$a < 0.02) {
            warning("Ricker a was estimated at less than 0.02. Setting to 0.02.")
            rick$a <- 0.02
          }
          # at most increase b by 50%
          if (rick$b > Est_b[i - 1, j] * 1.5) {
            warning("Jump in Ricker b was too large. Setting to 150% of previous value.")
            rick$b <- Est_b[i - 1, j] * 1.5
          }
          # at most decrease b by 50%
          if (rick$b < Est_b[i - 1, j] * 0.5) {
            warning("Jump in Ricker b was too large. Setting to 50% of previous value.")
            rick$b <- Est_b[i - 1, j] * 0.5
          }
          Est_a[i,j]<-rick$a
          Est_b[i,j]<-rick$b
        }
        escapement_goals <- ricker_escapement(Est_a[i,],Est_b[i,])
      } else { # no assessment
        Est_a[i,]<-Est_a[i-1,]
        Est_b[i,]<-Est_b[i-1,]
        # no assessment, use last year's values
        escapement_goals <- ricker_escapement(Est_a[i-1,],Est_b[i-1,])
      }
    }
    if (add_impl_error) {
      escapement_goals_fraction <- escapement_goals / A[i,]
      # avoid rbeta errors if fraction too big - would have got reduced below
      # anyways
      escapement_goals_fraction[escapement_goals_fraction > .95] <- .95
      escapement_goals_fraction_w_error <-  impl_error(mu =
        escapement_goals_fraction, sigma_impl = sigma_impl)
      escapement_goals <- escapement_goals_fraction_w_error * A[i,]
    }
    F[i, ] <- A[i, ] - escapement_goals # catch to leave escapement behind
    negative_F <- which(F[i, ] < 0)
    F[i, negative_F] <- 0
    E[i, ] <- A[i, ] - F[i, ] # escapement
  }
  return(list(A = A, F = F, E = E, Eps = epsilon_mat, A_params = A_params,
      Strays_leaving = Strays_leaving, Strays_joining = Strays_joining,
      env_ts = env_ts, stray_mat = stray_mat, n_pop = n_pop, n_t = n_t, b = b,
      Est_a = Est_a, Est_b = Est_b))
}
