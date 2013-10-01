\name{count_quasi_exts}
\alias{count_quasi_exts}
\title{Take \code{\link{meta_sim}} output objects and count quasi
extinctions}
\usage{
  count_quasi_exts(dat, quasi_thresh,
    ignore_pops_thresh = 5, duration = 1)
}
\arguments{
  \item{dat}{Input data. Should be a list of lists. The
  first level corresponds to the conservation plan and the
  second level corresponds to the replicate.}

  \item{quasi_thresh}{The quasi extinction threshold}

  \item{ignore_pops_thresh}{Threshold below which to ignore
  populations (e.g. if you started some populations with
  very low abundance and you don't want to count those
  populations.}

  \item{duration}{Number of years that the abundance must
  be below the \code{quasi_thresh} before being counted as
  quasi extinct.}
}
\value{
  A list of matrices. The list elements correspond to the
  conservation plans. The columns of the matrix correspond
  to the subpopulations that were above the
  \code{ignore_pops_thresh} level. The rows of the matrix
  correspond to the replicates.
}
\description{
  Take \code{\link{meta_sim}} output objects and count
  quasi extinctions
}
\examples{
\dontrun{
set.seed(1)
w_plans <- list()
w_plans[[1]] <- c(5, 1000, 5, 1000, 5, 5, 1000, 5, 1000, 5)
w_plans[[2]] <- c(5, 5, 5, 1000, 1000, 1000, 1000, 5, 5, 5)
w_plans[[3]] <- c(rep(1000, 4), rep(5, 6))
w_plans[[4]] <- rev(w_plans[[3]])
plans_name_sp <- c("Full range of responses", "Most stable only",
"Lower half", "Upper half")
 n_trials <- 50 # number of trials at each n conservation plan
 n_plans <- 4 # number of plans
 num_pops <- c(2, 4, 8, 16) # n pops to conserve
 w <- list()
 for(i in 1:n_plans) { # loop over number conserved
  w[[i]] <- list()
  for(j in 1:n_trials) { # loop over trials
    w[[i]][[j]] <- matrix(rep(625, 16), nrow = 1)
    w[[i]][[j]][-sample(1:16, num_pops[i])] <- 5
  }
 }
arma_env_params <- list(mean_value = 16, ar = 0.1, sigma_env = 2, ma = 0)

x_arma_sp <- run_cons_plans(w, env_type = "arma", env_params = arma_env_params)
count_quasi_exts(x_arma_sp$plans_port, quasi_thresh = 200)
}
}

