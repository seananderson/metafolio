#' Fit a Ricker curve

#S <- seq(100, 1000, length.out = 25)
#R <- sapply(S, function(x) ricker_ar1(spawners = x, a = 1.9, b = 900, sigma_sq_v = 0.01)$recruits)
#plot(S, log(R/S))

fit_ricker <- function(S, R) {
  m <- lm(log(R/S) ~ S)
  m.coef <- coef(m)
  a <- as.numeric(m.coef[1])
  b <- -as.numeric(a/m.coef[2])
  return(list(a = a, b = b))
}


