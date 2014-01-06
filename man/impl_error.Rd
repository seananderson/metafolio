\name{impl_error}
\alias{impl_error}
\title{Add implementation error}
\usage{
impl_error(mu, sigma_impl)
}
\arguments{
  \item{mu}{The mean}

  \item{sigma_impl}{Implementation error standard
  deviation}
}
\value{
A single numeric values representing a sample from a beta
distribution with the specified mean and standard
deviation.
}
\description{
Add implementation error with a beta distribution.
}
\examples{
y <- sapply(1:200, function(x) impl_error(0.5, 0.2))
hist(y)

y <- sapply(1:200, function(x) impl_error(0.3, 0.1))
hist(y)
}
\references{
Morgan, M. G. & Henrion, M. (1990). Uncertainty: A Guide to
Dealing with Uncertainty in Quantitative Risk and Policy
Analysis. Cambridge University Press.

Pestes, L. R., Peterman, R. M., Bradford, M. J., and Wood,
C. C. (2008). Bayesian decision analysis for evaluating
management options to promote recovery of a depleted salmon
population. 22(2):351-361.

http://stats.stackexchange.com/questions/12232/calculating-the-parameters-of-a-beta-distribution-using-the-mean-and-variance
}

