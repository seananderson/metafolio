
library(metafolio)

arma_env_params <- list(mean_value = 16, ar = 0.1, sigma_env = 2, ma = 0)

base1 <- meta_sim(n_pop = 10, env_params = arma_env_params,
  env_type = "arma", assess_freq = 5)

out <- sapply(1:30, function(x) {
  base1 <- meta_sim(n_pop = 10, stray_fraction = 0,
    env_params = arma_env_params, a_width_param = rep(0.05, 10),
    optim_temp = rep(16, 10),  max_a = rep(2.8, 10),
  env_type = "arma", assess_freq = 5
  )
  cv <- sd(base1$A) / mean(base1$A)
  cv
  })

out1 <- sapply(1:30, function(x) {
  base1 <- meta_sim(n_pop = 10, stray_fraction = 0.2,
    env_params = arma_env_params, a_width_param = rep(0.05, 10),
    optim_temp = rep(16, 10), max_a = rep(2.8, 10),
  env_type = "arma", assess_freq = 5
  )
  cv <- sd(base1$A) / mean(base1$A)
  cv
  })


out2 <- sapply(1:30, function(x) {
  base1 <- meta_sim(n_pop = 10, stray_fraction = 0.2,
    env_params = arma_env_params, a_width_param = rep(0.05, 10),
    optim_temp = rep(16, 10), max_a = rep(2.8, 10),
  env_type = "arma", assess_freq = 5
  )
  cv <- sd(base1$A) / mean(base1$A)
  cv
  })

