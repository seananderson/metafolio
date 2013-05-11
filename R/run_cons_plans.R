#' Run conservation plans and return the portfolio mean and variance
#' values
#'
#' This function takes a set of weights representing different
#' conservation plans and get the mean and variance in portfolio
#' space. This function allows a maximally complicated set of weights
#' to accommodate all possible scenarios. It can accommodate different
#' spatial strategies of conservation, conserving different numbers of
#' populations, and a lack of knowledge. You can do this by how you
#' set your \code{w} weight object. See the example.
#' 
#' @param w A (nested) list of weights. The first list level contains the
#' different plans. The next level contains repetitions for a given
#' plan. E.g. \code{cp[[2]][[1]]} contains the first iteration of the
#' second conservation plan. Each end element should be a matrix of
#' weights with one row and the number of columns equal to the number
#' of subpopulations.
#' @param env_type The environmental type to pass to
#' \code{\link{generate_env_ts}}
#' @param env_params The environmental parameters to pass to
#' \code{\link{generate_env_ts}}
#' @param show_progress Logical: show an indication of progress?
#' @export
#' @return A list of data frames. Each element of the list contains a
#' conservation plan. Each row of the data frames represents a trial
#' run.
#' @examples \dontrun{
#' ## in this version, the pops are wiped out; total abundance changes
#' n_trials <- 20 # number of trials at each n conservation plan
#' n_plans <- 4 # number of plans
#' num_pops <- c(2, 4, 8, 16) # n pops to conserve
#' w <- list()
#' for(i in 1:n_plans) { # loop over number conserved
#'  w[[i]] <- list()
#'  for(j in 1:n_trials) { # loop over trials
#'    w[[i]][[j]] <- matrix(rep(625, 16), nrow = 1)
#'    w[[i]][[j]][-sample(1:16, num_pops[i])] <- 5 # conserve num_pops[i] populations; wipe out rest
#'  }
#' }
#' 
#' ## ARMA:
#' x <- run_cons_plans(w, env_type = "arma", env_params = list(mean_value
#'     = 16, ar = 0.4, sigma_env = 1.4, ma = 0))
#'
#' cols <- RColorBrewer::brewer.pal(5, "Spectral")
#' # may look funny because we only have 20 trials in this example:
#' plot_cons_plans(x, plans_name = num_pops, cols = cols, add_all_efs = TRUE)
#' 
#' ## Linear:
#' x <- run_cons_plans(w, env_type = "linear", env_params = list(min_value
#'     = 11.5, max_value = 20.5, sigma_env = 0.1, start_t = 31)) 
#' }
run_cons_plans <- function(w, env_type, env_params, show_progress =
  TRUE) {

  plans_mv_n <- list()
  for(i in 1:length(w)) {
    plans_mv_n[[i]] <- list()
    n_trials <- length(w[[i]])
    for(j in 1:n_trials) {
      plans_mv_n[[i]][[j]] <- get_conserv_plans_mv(
        weights = w[[i]][[j]], 
        reps = 1,
        env_type = env_type,
        env_params = env_params
        )
    }
    if(show_progress)
      print(paste("Completed", i, "of", length(w), "conservation plans to evaluate"))
  }

  # Move to list of dataframes instead of list of list of dataframes
  # this is to match the typical output with even population numbers
  # across runs.

  plans_mv_n_dfs <- list() 
  for(i in 1:length(w)) {
    plans_mv_n_dfs[[i]] <- list() 
    for(j in 1:n_trials) {
      plans_mv_n_dfs[[i]][[j]] <- plans_mv_n[[i]][[j]][[1]]
    }
  }

  for(i in 1:length(w)) {
    plans_mv_n_dfs[[i]] <- do.call("rbind", plans_mv_n_dfs[[i]])
  }
  plans_mv_n_dfs
}

