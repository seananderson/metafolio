\name{plot_rickers}
\alias{plot_rickers}
\title{Plot sample ricker curves for each stock}
\usage{
  plot_rickers(x, pal, n_samples = 40,
    add_y_axes_pops = c(1, 6), add_x_axes_pops = c(6:10),
    burn = 1:30)
}
\arguments{
  \item{x}{Output list from \code{meta_sim}}

  \item{pal}{Colours for stocks}

  \item{n_samples}{Number of sample lines to draw from the
  a parameters}

  \item{add_y_axes_pops}{Panels to add y axes on}

  \item{add_x_axes_pops}{Panels to add x axes on}

  \item{burn}{Number of initial years to throw out as
  burnin}
}
\description{
  Plot sample ricker curves for each stock
}

