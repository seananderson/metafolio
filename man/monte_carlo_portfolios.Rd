\name{monte_carlo_portfolios}
\alias{monte_carlo_portfolios}
\title{Monte Carlo asset weights into portfolios}
\usage{
monte_carlo_portfolios(weights_matrix, n_sims = 500, mean_b = 1000,
  burn = 1:30, ...)
}
\arguments{
  \item{weights_matrix}{A matrix of asset weights. The
  columns correspond to the different assets and the rows
  correspond to the simulation iterations.}

  \item{n_sims}{The number of simulations to run.}

  \item{mean_b}{The mean Ricker capacity value.}

  \item{burn}{The number of years to discard as burn in.}

  \item{...}{Anything else to pass to
  \code{\link{meta_sim}}.}
}
\value{
A list object with three elements: \code{port_vals} (a
matrix with a column of mean rate of change and variance of
rate of change), \code{n_sims} (the number of simulations
ran), and \code{sims_out} (a list in which each element
corresponds to the output from the run of
\code{\link{meta_sim}}.
}
\description{
Monte Carlo the asset weights into portfolios and record
the simulation output and portfolio metrics (mean and
variance).
}
\examples{
weights_matrix <- create_asset_weights(n_pop = 4, n_sims = 3,
  weight_lower_limit = 0.001)
mc_ports <- monte_carlo_portfolios(weights_matrix = weights_matrix,
  n_sims = 3, mean_b = 1000)
}
\seealso{
\code{\link{meta_sim}}, \code{\link{create_asset_weights}}
}

