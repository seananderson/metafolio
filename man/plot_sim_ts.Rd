\name{plot_sim_ts}
\alias{plot_sim_ts}
\title{Plot various time series from a simulation run}
\usage{
plot_sim_ts(x, pal = rev(gg_color_hue(x$n_pop)), years_to_show = 30,
  burn = 1:50, shade_years = NULL, adj = 0.02, add_units = FALSE,
  yticks = rep(list(NA), x$n_pop))
}
\arguments{
  \item{x}{A list output object from a simulation run of
  \code{link{meta_sim}}.}

  \item{pal}{A colour palette for the lines. One colour per
  line (population time series).}

  \item{years_to_show}{How many years to plot after the
  burn in period.}

  \item{burn}{The number of years to discard as burn in at
  the beginning of the time series.}

  \item{adj}{\code{adj} parameter to pass to
  \code{\link[graphics]{mtext}} for panel labels}

  \item{shade_years}{Shade some years? Give a vector.
  Shading will be applied from the minimum to maximum
  value. Can be used to show burn in period.}

  \item{add_units}{Should the units be added to the y
  axis?}

  \item{yticks}{Position of ticks on the Y axis.}
}
\description{
This function is rather crude at the moment. It lets you
quickly visualize the time series of output from a
simulation run, but it isn't very flexible yet.
}
\examples{
arma_env_params <- list(mean_value = 16, ar = 0.1, sigma_env = 2, ma = 0)
base1 <- meta_sim(n_pop = 10, env_params = arma_env_params, env_type =
  "arma", assess_freq = 5)
plot_sim_ts(base1)
}

