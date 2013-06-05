#' Add implementation error

# From Pestes et al. 2008:

#portion harvested between 0 and 1:
#Hact,yr = beta(βh, γh), (1)
#where values of βh and γh were the beta distribution’s lo- cation and shape parameters, with βh = Htar,yr for a given year and γh = 0.1 (the latter determined by numerical ex- periment to approximate the observed implementation uncertainty).

impl_error <- function(mu, sigma_impl) {
  var <- sigma_impl ^ 2

est_beta_params <- function(mu, var) {
# http://stats.stackexchange.com/questions/12232/calculating-the-parameters-of-a-beta-distribution-using-the-mean-and-variance
  alpha <- ((1 - mu) / var - 1 / mu) * mu ^ 2
  beta <- alpha * (1 / mu - 1)
  return(list(alpha = alpha, beta = beta))
}

bp <- est_beta_params(mu, var)
#print(bp)
#hist(rbeta(10000, bp$alpha, bp$beta))
#rbeta(1, bp$alpha, bp$beta)
mapply(rbeta, n = 1, shape1 = bp$alpha, shape2 = bp$beta)
}

