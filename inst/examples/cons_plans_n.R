#' A wider variety of conservation plans; also try and better mimic
#' what VSP guidelines do and do not suggest

# first show difference of increasing the number of streams you
# maintain:

require(plyr)
num_pops <- c(2, 4, 8, 16, 32)
tot_abund <- 10000
w <- list()
for(i in 1:length(num_pops)) {
  w[[i]] <- matrix(rep(1, num_pops[i]) * (tot_abund / num_pops[i]), nrow = 1)
}

plans_name <- num_pops
w_show <- seq_len(length(num_pops))

if(USE_CACHE) {
  load("plans_mv.rda")
}else{
  plans_mv_arma_n <- list()
  plans_mv_linear_n <- list()
  for(i in 1:length(num_pops)) {
    #plans_mv_arma_n[[i]] <- get_conserv_plans_mv(
      #weights = w[[i]], 
      #env_type = "arma",
      #env_params = list(mean_value = 16, ar = 0.4, sigma_env = 1.4, ma = 0)
      #)
    plans_mv_linear_n[[i]] <- get_conserv_plans_mv(
      weights = w[[i]], 
      env_type = "linear",
      env_params = list(min_value = 10, max_value = 20, sigma_env = 0.2))
    print(paste("Completed", i, "of", length(num_pops), "conservation plans to evaluate"))
  }

  # move to list of dataframes instead of list of list of dataframes
  # this is to match the typical output with even population numbers
  # across runs
  plans_mv_arma_n_dfs <- list() 
  plans_mv_linear_n_dfs <- list() 
  for(i in 1:length(num_pops)) {
    plans_mv_arma_n_dfs[[i]] <- plans_mv_arma_n[[i]][[1]]
    plans_mv_linear_n_dfs[[i]] <- plans_mv_linear_n[[i]][[1]]
  }
  save(plans_mv_arma_n_dfs, plans_mv_linear_n_dfs, file = "plans_mv_n.rda")
}

source("plot_cons_plans.R")
par(mfrow = c(1, 2))
require(RColorBrewer)
#cols <- brewer.pal(6, "RdYlGn")
cols <- brewer.pal(6, "Spectral")
par(cex = 0.7, mar = c(4,5,0,0), oma = c(.5,.5,.5,.5), mgp = c(3, .5, 0), tck = -0.01, las = 1)
j <- plot_cons_plans(plans_mv_arma_n_dfs, plans_name, cols = cols, add_all_efs = TRUE)
plot_cons_plans(plans_mv_linear_n_dfs, plans_name, cols = cols, xlim = j$xlim, ylim = j$ylim, add_all_efs = TRUE)

