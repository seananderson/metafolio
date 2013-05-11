\name{fit_ricker_fast}
\alias{fit_ricker_fast}
\title{Fit a Ricker curve (quickly)}
\usage{
  fit_ricker_fast(S, R)
}
\arguments{
  \item{S}{Spawners}

  \item{R}{Recruits or returns}
}
\description{
  This version uses \code{\link{stats::lm.fit}} by directly
  specifying the model matrix. This is about an order of
  magnitude faster than \code{\link{fit_ricker}}.
}

