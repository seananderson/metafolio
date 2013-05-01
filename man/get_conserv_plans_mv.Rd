\name{get_conserv_plans_mv}
\alias{get_conserv_plans_mv}
\title{Run the metapopulation simulation for various conservation privatization schemes}
\usage{
  get_conserv_plans_mv(weights, reps = 150,
    assess_freq = 50, ...)
}
\arguments{
  \item{weights}{A matrix of habitat weights. Each row
  corresponds to another scenario. Each column is a
  different habitat location.}

  \item{reps}{Number of portfolios to simulate.}

  \item{assess_freq}{The frequency (in generations) of
  spawner-recruit re-assessment. Passed to \code{meta_sim}.
  Defaults to 50 generations to speed up simulations.}

  \item{...}{Other values to pass to \code{meta_sim}}
}
\description{
  Run the metapopulation simulation for various
  conservation privatization schemes
}
\details{
  Returns the portfolio mean and variance values.
}

