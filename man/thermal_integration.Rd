\name{thermal_integration}
\alias{thermal_integration}
\title{Get maximum Ricker a values for a given number of populations}
\usage{
  thermal_integration(n_pop,
    width_params = c(seq(0.05, 0.02, length.out = n_pop/2), rev(seq(0.05, 0.02, length.out = n_pop/2))),
    optim_temps = seq(13, 19, length.out = n_pop))
}
\arguments{
  \item{n_pop}{The number of populations}
}
\description{
  Get maximum Ricker a values for a given number of
  populations
}

