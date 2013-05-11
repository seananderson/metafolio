\name{plot_sim_ts}
\alias{plot_sim_ts}
\title{Plot various time series from a simulation runn}
\usage{
  plot_sim_ts(x, pal = rev(gg_color_hue(x$n_pop)),
    years_to_show = 30, burn = 1:50, shade_years = NULL,
    adj = 0.02)
}
\arguments{
  \item{x}{A list output object from a simulation run.}

  \item{years_to_show}{How many years to plot after the
  burn in period.}

  \item{burn}{The number of years to discard as burnin a
  the beginning of the time series.}

  \item{adj}{adj parameter to mtext for panel labels}

  \item{shade_years}{Shade some years? Give a vector. Can
  be used to show burn in period.}
}
\description{
  Plot various time series from a simulation runn
}

