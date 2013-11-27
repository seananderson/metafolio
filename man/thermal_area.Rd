\name{thermal_area}
\alias{thermal_area}
\title{Return desired squared deviation between desired area and actual
area under a curve}
\usage{
  thermal_area(max_a, desired_area, optim_temp,
    width_param, lower = -5, upper = 40)
}
\arguments{
  \item{max_a}{Maximum Ricker a productivity value}

  \item{desired_area}{Desired area under the thermal curve}

  \item{optim_temp}{Optimal temperature}

  \item{width_param}{The width parameter as a numeric
  value}

  \item{lower}{Lower bound to pass to
  \code{\link[stats]{uniroot}}}

  \item{upper}{Upper bound to pass to
  \code{\link[stats]{uniroot}}}
}
\description{
  The function finds the lower and upper roots (where the
  thermal curve crosses 0) with the
  \code{\link[stats]{uniroot}} function and then integrates
  the area under the thermal curve with the
  \code{\link[stats]{integrate}} function. This is useful
  as part of the optimization routine in
  \code{\link{optim_thermal}}.
}

