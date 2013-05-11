\name{thermal_curve_a_fast}
\alias{thermal_curve_a_fast}
\title{Create thermal tolerance curves (quickly using C++)}
\usage{
  thermal_curve_a_fast(temp, optim_temp = 15, max_a = 1.4,
    width_param = 0.02)
}
\arguments{
  \item{temp}{The input temperature value.}

  \item{optim_temp}{The optimal temperature.}

  \item{max_a}{The maximum productivity parameter `a` from
  a Ricker model (or whatever the y-axis value is you want
  to return).}

  \item{width_param}{A parameter to control the width of
  the parabola. Smaller numbers make wider parabolas.}
}
\value{
  A productivity parameter given the location on a thermal
  tolerance curve.
}
\description{
  Creates a quadratic thermal tolerance curve of the form:
  width_param * (temp - optim_temp)^2 + max_a Negative
  values are returned as 0. This version uses C++ and about
  twice as fast as \code{\link{thermal_curve_a}}
}

