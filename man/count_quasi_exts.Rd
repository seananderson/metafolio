\name{count_quasi_exts}
\alias{count_quasi_exts}
\title{Take \code{\link{meta_sim}} output objects and count quasi
extinctions}
\usage{
  count_quasi_exts(dat, quasi_thresh,
    ignore_pops_thresh = 5, duration = 1)
}
\arguments{
  \item{dat}{Input data. Should be a list of lists. The
  first level corresponds to the conservation plan and the
  second level corresponds to the replicate.}

  \item{quasi_thresh}{}

  \item{ignore_pops_thresh}{}

  \item{duration}{}
}
\value{
  A list of matrices. The list elements correspond to the
  conservation plans. The columns of the matrix correspond
  to the subpopulations that were above the
  \code{ignore_pops_thresh} level. The rows of the matrix
  correspond to the replicates.
}
\description{
  Take \code{\link{meta_sim}} output objects and count
  quasi extinctions
}
\examples{
\dontrun{
count_quasi_exts(x_arma_sp$plans_port, quasi_thresh = 200)
}
}

