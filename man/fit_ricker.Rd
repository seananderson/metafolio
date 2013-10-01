\name{fit_ricker}
\alias{fit_ricker}
\title{Fit a Ricker curve (quickly)}
\usage{
  fit_ricker(S, R)
}
\arguments{
  \item{S}{Spawners as a numeric vector.}

  \item{R}{Recruits or returns as a numeric vector.}
}
\value{
  A named list with components \code{a} for the intercept
  and \code{b} for the slope.
}
\description{
  Fit a Ricker curve to spawner-recruit data and return the
  intercept (a) and slope (b). This function uses
  \code{lm.fit()} by directly specifying the model matrix.
  This is about an order of magnitude faster than
  \code{lm()}.
}
\examples{
S <- seq(100, 1000, length.out = 100)
v_t <- rnorm(100, 0, 0.1)
R <- ricker_v_t(spawners = S, a = 1.9, b = 900, d = 1, v_t)
plot(S, log(R/S))
fit_ricker(S, R)
}

