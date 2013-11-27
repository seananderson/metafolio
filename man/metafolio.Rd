\docType{package}
\name{metafolio}
\alias{metafolio}
\alias{metafolio-package}
\title{metafolio: An \R package to simulate salmon metapopulation for portfolio
optimization}
\description{
  The metafolio \R package is a tool to simulate
  metapopulations and apply financial portfolio
  optimization concepts to those metapopulations. The
  package is primarily intended for salmon simulations, but
  could be adapted for other taxonomic groups.
}
\details{
  The main functions are:
}
\section{Running a simulation once}{
  \code{\link{meta_sim}} \code{\link{plot_sim_ts}}
}

\section{Assessing multiple conservation scenarios}{
  \code{\link{run_cons_plans}}
  \code{\link{plot_cons_plans}}
}

\section{Specifying environmental patterns}{
  \code{\link{generate_env_ts}}
}

\section{Diagnostic plots}{
  \code{\link{plot_rickers}}
  \code{\link{plot_correlation_between_returns}}
}

\section{Portfolio optimization}{
  \code{\link{create_asset_weights}}
  \code{\link{monte_carlo_portfolios}}
  \code{\link{plot_efficient_portfolios}}

  See the package vignette \code{vignette("metafolio")} for
  more extensive explanation of how to use the
  \code{metafolio} \R package.
}

