\name{is_quasi_ext}
\alias{is_quasi_ext}
\title{Return whether there was an instance of quasi extinction}
\usage{
is_quasi_ext(x, thresh, duration = 1)
}
\arguments{
  \item{x}{A numeric vector.}

  \item{thresh}{The quasi-extinction threshold in absolute
  numbers.}

  \item{duration}{The number of years below the threshold
  before a quasi extinction has occurred.}
}
\description{
Return whether there was an instance of quasi extinction
}
\examples{
x <- seq(100, 0, length.out = 20)
is_quasi_ext(x, thresh = 10)
}

