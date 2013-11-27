\name{plot_efficient_portfolios}
\alias{plot_efficient_portfolios}
\title{Basic plot of efficient portfolio and asset contributions}
\usage{
  plot_efficient_portfolios(port_vals, weights_matrix, pal,
    plot = TRUE,
    ylab_dots = "Mean of metapopulation growth rate",
    xlab_dots = "Variance of metapopulation growth rate",
    ylab_bars = "Percentage",
    xlab_bars = "Variance (multiplied by 1000)",
    port_cols = c("grey50", "red"), pch = 19, ...)
}
\arguments{
  \item{port_vals}{A matrix of means and variances (down
  the two columns).  This likely comes from the output of
  \code{\link{monte_carlo_portfolios}}.}

  \item{weights_matrix}{The same weight matrix that was
  passed to \code{\link{monte_carlo_portfolios}}.}

  \item{pal}{Colour palette for the stocks/assets in the
  barplot.}

  \item{plot}{Logical: should the plots be made?}

  \item{ylab_dots}{Y axis label for the mean-variance
  scatterplot.}

  \item{xlab_dots}{X axis label for the mean-variance
  scatterplot.}

  \item{ylab_bars}{Y axis label for the barplot.}

  \item{xlab_bars}{X axis label for the barplot.}

  \item{port_cols}{Colours for the dots. A vector of
  colours for the non-efficient and efficient portfolios.}

  \item{pch}{Dot type}

  \item{...}{Anything else to pass to both
  \code{\link[graphics]{plot.default}} and
  \code{\link[graphics]{barplot}}.}
}
\value{
  A two panel plot and an (invisible) list of values
  calculated within the function. This list contains
  \code{pv} (mean, variance, and whether it was part of the
  efficient frontier); \code{ef_port_ids} (the portfolio
  IDs [run numbers] that are part of the efficient
  frontier; \code{min_var_port_id} (the portfolio ID for
  the minimum-variance portfolio); \code{ef_weights} (the
  weights of the portfolios on the efficient frontier).
}
\description{
  This function creates a mean-variance plot of the
  portfolios across possible asset weights, colour the
  efficient frontier, and show the contribution of the
  different stocks/assets. It also (invisibly) returns the
  values that make up the plot so you can create your own
  custom plots with the data. See the Returns section for
  more details.
}
\examples{
\dontrun{
set.seed(10)
weights_matrix <- create_asset_weights(n_pop = 5, n_sims = 150,
  weight_lower_limit = 0.001)
mc_ports <- monte_carlo_portfolios(weights_matrix = weights_matrix,
  n_sims = 150, mean_b = 1000)
pal <- rev(gg_color_hue(5))
d <- plot_efficient_portfolios(mc_ports$port_vals, weights_matrix,
  pal = pal)
names(d)
}
}

