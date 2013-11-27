\name{plot_cons_plans}
\alias{plot_cons_plans}
\title{Plot conservation plans in mean-variance space}
\usage{
  plot_cons_plans(plans_mv, plans_name, cols, xlim = NULL,
    ylim = NULL, add_pts = TRUE, add_all_efs = FALSE,
    x_axis = TRUE, y_axis = TRUE, add_legend = TRUE,
    w_show = "all", xlab = "Variance", ylab = "Mean", ...)
}
\arguments{
  \item{plans_mv}{The \code{plans_mv} element of the output
  from \code{\link{run_cons_plans}}.}

  \item{plans_name}{A character vector of what to label
  each conservation plan.}

  \item{cols}{Colours for the conservation plan polygons.}

  \item{xlim}{X limits}

  \item{ylim}{Y limits}

  \item{add_pts}{Logical: add the points?}

  \item{add_all_efs}{Logical: add efficient frontiers?}

  \item{x_axis}{Logical: add x axis?}

  \item{y_axis}{Logical: add y axis?}

  \item{add_legend}{Logical: add y legend?}

  \item{w_show}{If \code{"all"} then all plans will be
  shown. If a numeric vector, then those plans will be
  shown. E.g. \code{c(1, 3)} will only show the first and
  third plans.}

  \item{xlab}{X axis label.}

  \item{ylab}{Y axis label.}

  \item{...}{Anything else to pass to
  \code{\link[graphics]{plot.default}}.}
}
\value{
  A plot. Also, the x and y limits are returned invisibly
  as a list.  This makes it easy to make the first plot and
  then save those x and y limits to fix them in subsequent
  (multipanel) plots.
}
\description{
  This makes a mean-variance plot of the portfolio output.
  It can take care of: plotting the individual portfolios,
  adding 2D kernel density polygons at two quantile levels,
  adding an efficient frontier.
}

