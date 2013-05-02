#' Run a (salmon) metapopulation simulation.
#' 
#' @param n_t The number of years.
#' @param n_pop Number of (sub)populations
#' @param stray_decay_rate Rate that straying (exponentially) decays with 
#' distance.
#' @param stray_fraction Fraction of fish that stray from natal streams.
#' @param b Ricker density-dependent parameter. Should be one per 
#' (sub)population.
#' @param spawners_0 A vector of spawner abundances at the start of the 
#' simulation. Length of the vector should equal the number of subpopulations.
#' @param sigma_v Stock-recruit residual standard deviation. Will be 
#' exponentiated.
#' @param v_rho AR1 serial correlation of stock-recruit residuals.
#' @param a_width_param Width of the thermal curves by (sub)population.
#' @param optim_temp Optimal temperatures by (sub)population.
#' @param max_a Maximum Ricker productivity parameters (a) by (sub)population.
#' The value obtained at the optimum temperature.m
#' @param env_type The type of environmental time series to generate.  One of 
#' "sine", "arma", "regime", "linear", or "constant".
#' @param env_params Parameters to pass on to \code{generate_env_ts}. You must 
#' provide the appropriate list given your chosen type of environmental signal.
#' @param start_assessment Generation to start estimating SR
#' relationship for escapement targets
#' @param assessment_window Number of generations to use when fitting
#' SR relationship for escapement targets; must be bigger than
#' start_assessment
#' @param sigma_impl implementation sd for beta distribution
#' @param assess_freq How many generations before re-assessing a and b
#' parameters.
#' @param use_cache Use the stochastically generated values (SR residuals and
#' possibly environmental time series) from the previous run?
#' @param add_straying Implement straying between (sub)populations?
#' @param add_impl_error Add implementation error?
meta_sim <- function(
  n_t = 100, # number of years
  n_pop = 10, # number of subpopulations
  stray_decay_rate = 0.3, # rate that straying decays with distance
  stray_fraction = 0.000001, # fraction of fish that stray from natal streams
  b = rep(1000, n_pop), # Ricker density-dependent parameter
  spawners_0 = round(b), # spawners at start
  sigma_v = 0.3, # stock-recruit residual SD
  v_rho = 0.4, # stock-recruit residual AR1 correlation
  a_width_param = c(seq(0.05, 0.02, length.out = n_pop/2), rev(seq(0.05, 0.02, length.out = n_pop/2))), # width of thermal curves by pop
  optim_temp = seq(13, 19, length.out = n_pop), # optimal temperatures by pop
  max_a = c(seq(2.8, 2.2, length.out = n_pop/2), rev(seq(2.8, 2.2, length.out = n_pop/2))), # maximum Ricker a values by pop at optimum temp
  env_type = c("sine", "arma", "regime", "linear", "constant"),
  env_params = list(amplitude = 3.2, ang_frequency = 0.2, phase = runif(1, -pi, pi), mean_value = 15, slope = 0, sigma_env = 0.30),
  start_assessment = 20, # generation to start estimating SR relationship for escapement targets
  assessment_window = 25, # number of generations to use when fitting SR relationship for escapement targets; must be bigger than start_assessment
  sigma_impl = 0.05, # sd on beta implementation error
  assess_freq = 10, # how many generations between SR assessments
  use_cache = FALSE, # regenerate stochastic values? 
  add_straying = TRUE, # include or ignore straying
  add_impl_error = TRUE # include implementation error?
) {
  
#   source("generate_env_responses.R")
#   source("generate_env_ts.R")
#   source("ricker_v_t.R")
#   source("ricker_escapement.R")
#   source("generate_straying_matrix.R")
#   source("thermal_curve_a.R")
#   
  # create vectors and matrices that are not developed iteratively:
  if(use_cache) {
    load("sim_dat.rda")
  }else{
    env_type <- env_type[1]
    env_ts <- switch(env_type, 
      sine = generate_env_ts(n_t = n_t, type = "sine", sine_params = env_params),
      arma = generate_env_ts(n_t = n_t, type = "arma", arma_params = env_params),
      regime= generate_env_ts(n_t = n_t, type = "regime", regime_params = env_params),
      linear= generate_env_ts(n_t = n_t, type = "linear", linear_params = env_params),
      constant= generate_env_ts(n_t = n_t, type = "constant", 
        constant_params = env_params)
    )
    stray_mat <- generate_straying_matrix(n_pop = n_pop, stray_fraction
      = stray_fraction, stray_decay_rate = stray_decay_rate)
    
    epsilon_mat <- matrix(ncol = n_pop, nrow = n_t)
    epsilon_mat[1, ] <- rnorm(n_pop, mean = 0, sd = sigma_v)
    for(i in 2:n_t) {
      epsilon_mat[i, ] <- epsilon_mat[i - 1, ] * v_rho + rnorm(n_pop, mean = 0, sd = sigma_v) # stock-recruit residuals
    }
# now develop random escapement targets at start of open access
    r_escp_goals <- matrix(nrow = start_assessment, ncol = n_pop, data = runif(n_pop*start_assessment, 0.1, 0.9))
    save(env_ts, stray_mat, epsilon_mat, r_escp_goals, file = "sim_dat.rda")
  }
  
  # matrices to store output:
  A <- matrix(ncol = n_pop, nrow = n_t) # total abundance (say returns)
  F <- matrix(ncol = n_pop, nrow = n_t) # fisheries catch
  E <- matrix(ncol = n_pop, nrow = n_t) # escapement
  Eps <- matrix(ncol = n_pop, nrow = n_t) # S-R residuals, for AR1 tracking
  A_params <- matrix(ncol = n_pop, nrow = n_t) # a parameters from Ricker
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
      # environment section:
      a_i <- thermal_curve_a(env_ts[i], optim_temp = optim_temp[j], max_a = max_a[j], width_param = a_width_param[j]) 
      A_params[i, j] <- a_i
      # spawner-recruit section:
      A[i, j] <- ricker_v_t(spawners = E[i-1, j], a = a_i, 
        b = b[j], v_t = epsilon_mat[i, j], d = 1.00)  # note depensation added!!!!
      #A[i, j] <- ricker_out
      #Eps[i, j] <- ricker_out$eps
      #if(is.na(A[i,j])) browser()
      if(A[i,j] < 0) warning("Abundance before straying or harvesting was < 0.")
    }
    # now we have the returns for this year, let's allocate straying:
    if(add_straying) {
      to_reallocate <- matrix(ncol = n_pop, nrow = n_pop)
      for(j in 1:n_pop) {
        to_reallocate[j, ] <- stray_mat[j, ] * A[i, j]  # from column to row populations
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

    # fit recent data to get estimated a and b values, set escapement
    # based on these
    if(i < start_assessment) escapement_goals <- A[i, ] * r_escp_goals[i, ] # random fishery for first X years, establish S-R data to work with
    #if(i == 30) Est_a[i, ] <- max_a # set starting values to check against
    if(i == (start_assessment - 1)) Est_b[i, ] <- b # sanity check - make sure estimate isn't too far from this
    if(i >= start_assessment) {
      #if(i == 101) browser()
      if((i - start_assessment)%%assess_freq == 0) { # every 20th year, re-assess a and b
        for(j in 1:n_pop) {
          #browser()
          #recruits <- A[(i - assessment_window):i, j]
          recruits <- A[3:i, j]
          #spawners <- E[(i - 1 - assessment_window):(i - 1), j]
          spawners <- E[2:(i - 1), j]
          rick <- fit_ricker(R = recruits, S = spawners)
          #if( i == 57) browser()
          #if(j == 1) plot(spawners, log(recruits/spawners), main = i)
          #if(j == 1) print(rick)
          # bounds for sanity:
          if(rick$a > 4) rick$a <- 4
          if(rick$a < 0.02) rick$a <- 0.02
          if(rick$b > Est_b[i - 1, j] * 1.5) rick$b <- Est_b[i - 1, j] * 1.5 # at most increase b by 50% 
          if(rick$b < Est_b[i - 1, j] * 0.5) rick$b <- Est_b[i - 1, j] * 0.5 # at most decrease b by 50% 
          Est_a[i,j]<-rick$a
          Est_b[i,j]<-rick$b
    
          }
        escapement_goals <- ricker_escapement(Est_a[i,],Est_b[i,])
      }else{ # no assessment
          Est_a[i,]<-Est_a[i-1,]
          Est_b[i,]<-Est_b[i-1,]
        escapement_goals <- ricker_escapement(Est_a[i-1,],Est_b[i-1,]) # no assessment, use last year's values
      }
    }
    #if (i == start_assessment) browser()
    #escapement_goals <- ricker_escapement(A_params[i,],b) # b is also a vector
    if(add_impl_error) {
      escapement_goals_fraction <- escapement_goals / A[i,]
      escapement_goals_fraction[escapement_goals_fraction > .95] <- .95 # avoid rbeta errors if fraction too big - would have got reduced below anyways
      escapement_goals_fraction_w_error <-  impl_error(mu = escapement_goals_fraction, sigma_impl = sigma_impl)
      escapement_goals <- escapement_goals_fraction_w_error * A[i,]
    }
    F[i, ] <- A[i, ] - escapement_goals # catch to leave escapement behind
    negative_F <- which(F[i, ] < 0)
    F[i, negative_F] <- 0
    E[i, ] <- A[i, ] - F[i, ] # escapement
  }
  return(list(A = A, F = F, E = E, Eps = epsilon_mat, A_params = A_params, 
    Strays_leaving = Strays_leaving, Strays_joining = Strays_joining, 
    env_ts = env_ts, stray_mat = stray_mat, n_pop = n_pop, n_t = n_t, b = b, Est_a = Est_a, Est_b = Est_b))
}

