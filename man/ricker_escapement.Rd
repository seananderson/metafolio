\name{ricker_escapement}
\alias{ricker_escapement}
\title{Assign a salmon escapement target based on a Ricker curve}
\usage{
  ricker_escapement(a, b)
}
\arguments{
  \item{a}{Ricker productivity parameter.}

  \item{b}{Ricker density-dependent parameter.}
}
\description{
  Sets escapement according to Hilborn and Walters (1992)
  p272, Table 7.2. Smsy = b(0.5 - 0.07*a).
}
\examples{
ricker_escapement(1.1, 1000)
}
\references{
  Hilborn, R.W. and Walters, C. 1992. Quantitative
  fisheries stock assessment: Choice, dynamics, and
  uncertainty. Chapman and Hall, London.
}

