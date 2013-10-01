\name{create_asset_weights}
\alias{create_asset_weights}
\title{Create an asset weights matrix}
\usage{
  create_asset_weights(n_pop, n_sims,
    weight_lower_limit = 0.02)
}
\arguments{
  \item{n_pop}{The number of subpopulations.}

  \item{n_sims}{The number of simulations.}

  \item{weight_lower_limit}{The lowest fraction allowed for
  a subpopulation weight. For example, a value of 0.02
  means a subpopulation will at least be assigned 2% of the
  total capacity}
}
\value{
  A matrix. The columns represent subpopulations. The rows
  represent simulation repetitions.
}
\description{
  Create an asset weight matrix to run through the Monte
  Carlo algorithm and test possible portfolios.
}
\examples{
create_asset_weights(n_pop = 5, n_sims = 10, weight_lower_limit = 0.001)
}

