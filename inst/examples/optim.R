#' 



f2 <- function(b = rep(1000, 9)) {
  if(sum(b) > 10000){
    r<- Inf
  }else{
    b <- c(b, 10000-sum(b))
    p <- meta_sim(b = b,
      n_pop = length(b),
      env_type = "linear",
      env_params = list(min_value = 10, max_value = 20, sigma_env = 0.2),
      use_cache = TRUE,
      start_assessment = 20,
      assessment_window = 50,
      sigma_impl = 1e-9
      )
    mv <- get_port_vals(p)
    r <- -log(as.numeric(mv[2]))
  }
  return(r)
}

x<-f2()

library(DEoptim)

j <- DEoptim(f2, lower = rep(10, 9), upper = rep(9999, 9), control = list(itermax = 20))
plot(j)
