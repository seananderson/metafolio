#' 



f2 <- function(b = rep(1000, 9)) {
  print(sum(b))
  if(sum(b) > 10000){
    r<- Inf
  }else{
    b <- c(b, 10000-sum(b))
    p <- meta_sim(b = b,
      n_pop = length(b),
      env_type = "linear",
      env_params = list(min_value = 12, max_value = 20, sigma_env = 0.001),
      use_cache = TRUE,
      sigma_impl = 1e-9,
      add_impl_error = FALSE
      )
    mv <- get_port_vals(p)
    r <- -log(as.numeric(mv[2]))
  }
  return(r)
}

x<-f2()

library(DEoptim)

j <- DEoptim(f2, lower = rep(5, 9), upper = rep(2000, 9), control = list(itermax = 10))
plot(j)
