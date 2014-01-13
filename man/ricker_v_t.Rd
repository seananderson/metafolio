\name{ricker_v_t}
\alias{ricker_v_t}
\title{Ricker stock-recruit function with specified error}
\usage{
ricker_v_t(spawners, a, b, d, v_t)
}
\arguments{
  \item{spawners}{A single spawner abundance}

  \item{a}{Ricker productivity parameter. Recruits are e^a
  at the origin.}

  \item{b}{Ricker density dependent parameter.}

  \item{d}{Depensation parameter. A value of 1 means no
  depensation. Larger values indicate depensation.}

  \item{v_t}{A single residual on the curve. Will be
  exponentiated. Note that we are *not* bias correcting
  within this function (subtracting half the variance
  squared) and so the deviations will not be mean unbiased
  unless they were bias corrected previously.}
}
\value{
Returns a vector of recruits.
}
\description{
Ricker stock-recruit function with specified error
}
\examples{
plot(1, 1, xlim = c(1, 100), ylim = c(0, 90), type = "n", xlab = "Spawners",
  ylab = "Returns")
for(i in 1:100) {
points(i, ricker_v_t(i, a = 1.1, b = 60, d = 1, v_t = rnorm(1, mean =
  -(0.1^2)/2, sd = 0.1)))
}
}

