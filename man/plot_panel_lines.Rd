\name{plot_panel_lines}
\alias{plot_panel_lines}
\title{Standard matrix plot of values by stream for one panel:}
\usage{
plot_panel_lines(dat, ymin = c("zero", "min"), ystretch = 1.1, ...)
}
\arguments{
  \item{dat}{The matrix of values to plot}

  \item{ymin}{Minimum y value for axis}

  \item{ystretch}{A fraction to multiply the max value of
  when setting the y axis limits. This is useful to make
  space for a panel label within the plot.}

  \item{...}{Anything else to pass to
  \code{\link[graphics]{matplot}}.}
}
\description{
Standard matrix plot of values by stream for one panel:
}

