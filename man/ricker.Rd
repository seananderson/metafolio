\name{ricker}
\alias{ricker}
\title{A simple Ricker model}
\usage{
  ricker(spawners, a, b)
}
\arguments{
  \item{spawners}{Spawner abundance}

  \item{a}{Ricker productivity parameter. Recruits are e^a
  at the origin.}

  \item{b}{Ricker density dependent parameter.}
}
\value{
  Returns a vector of recruits.
}
\description{
  A simple Ricker model
}
\examples{
S <- seq(100, 1000, length.out = 100)
R <- ricker_ar1(S, a = 1.9, b = 900)
plot(S, R)
}

