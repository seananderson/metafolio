\name{ricker_v_t}
\alias{ricker_v_t}
\title{Ricker stock-recruit function with specified error}
\usage{
  ricker_v_t(spawners, a, b, d, v_t)
}
\arguments{
  \item{spawners}{Spawner abundance}

  \item{a}{Ricker productivity paramater. Recruits are e^a
  at the origin.}

  \item{b}{Ricker density dependent parameter.}

  \item{v_t}{Residual on the curve. Will be exponentiated.}
}
\description{
  Ricker stock-recruit function with specified error
}
\examples{
x <- seq(1, 100)
v_t <- as.numeric(arima.sim(n = 100, model = list(ar = 0.3), sd = 0.1, mean = 0))
plot(x, ricker_v_t(spawners = x, a = 1.1, b = 60, v_t))
}

