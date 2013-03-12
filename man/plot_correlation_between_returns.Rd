\name{plot_correlation_between_returns}
\alias{plot_correlation_between_returns}
\title{Plot correlation of returns across stocks.}
\usage{
  plot_correlation_between_returns(x, burn = 1:30,
    pal = gg_color_hue(x$n_pop))
}
\arguments{
  \item{x}{A list output object from \code{meta_sim}.}

  \item{burn}{Number of years to discard at start as
  burnin.}

  \item{pal}{Colours to plot with for stocks.}
}
\description{
  Plot correlation of returns across stocks.
}

