\name{fit_ricker}
\alias{fit_ricker}
\title{Fit a Ricker curve}
\usage{
  fit_ricker(S, R)
}
\arguments{
  \item{S}{Spawners}

  \item{R}{Recruits or returns}
}
\description{
  Fit a Ricker curve
}
\examples{
S <- seq(100, 1000, length.out = 25)
R <- sapply(S, function(x) ricker_ar1(spawners = x, a = 1.9, b =
900, sigma_sq_v = 0.01)$recruits)
plot(S, log(R/S))
}

