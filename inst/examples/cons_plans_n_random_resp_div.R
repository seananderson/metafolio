#' Show difference of increasing the number of streams you maintain
#' with unknown response diversity
#'
#' In this version, the response diversity is randomly drawn
#'

USE_CACHE <- TRUE

require(plyr)
num_pops <- c(2, 4, 8, 16, 32)
tot_abund <- 10000
n_trials <- 60 # number of trials at each n conservation plan
#w <- list()
#for(i in 1:length(num_pops)) {
  #w[[i]] <- matrix(rep(1, num_pops[i]) * (tot_abund / num_pops[i]), nrow = 1)
#}
#plans_name <- num_pops

#### in this version, the pops are wiped out; total abundance changes
w <- list()

for(i in 1:4) { # loop over number conserved
  w[[i]] <- list()
  for(j in 1:n_trials) { # loop over trials
    w[[i]][[j]] <- matrix(rep(625, 16), nrow = 1)
    w[[i]][[j]][-sample(1:16, num_pops[i])] <- 5 # conserve num_pops[i] populations; wipe out rest
  }
}
  
plans_name <- num_pops[1:4]
####

w_show <- seq_len(length(w))

#if(USE_CACHE) {
  #load("plans_mv_n.rda")
#}else{
  plans_mv_arma_n <- list()
  plans_mv_linear_n <- list()
  for(i in 1:length(w)) {
    #plans_mv_arma_n[[i]] <- list()
    plans_mv_linear_n[[i]] <- list()
    for(j in 1:n_trials) {
      #plans_mv_arma_n[[i]][[j]] <- get_conserv_plans_mv(
      plans_mv_linear_n[[i]][[j]] <- get_conserv_plans_mv(
        weights = w[[i]][[j]], 
        reps = 1,
        #env_type = "arma",
        env_type = "linear",
        #env_params = list(mean_value = 16, ar = 0.4, sigma_env = 1.4, ma = 0)
        env_params = list(min_value = 11.5, max_value = 20.5, sigma_env = 0.1, start_t = 31)
        )
      #plans_mv_linear_n[[i]] <- get_conserv_plans_mv(
      #weights = w[[i]], 
      #reps = 30,
      #env_type = "linear",
      #env_params = list(min_value = 10, max_value = 20, sigma_env = 0.2))
    }
      print(paste("Completed", i, "of", length(w), "conservation plans to evaluate"))
  }

####### TEMPORARY TODO remove this
####### look at one realization:
#w <- list()
#for(i in 1:4) w[[i]] <- matrix(rep(625, 16), nrow = 1)
#w[[1]][-c(1, 16)] <- 5 # 2 pops
#w[[2]][-c(1,2,15,16)] <- 5 # 4 pops
#w[[3]][-c(1:4,13:16)] <- 5 # 8 pops
#eg1 <- meta_sim(b = w[[1]], n_pop = 16, env_type = "linear", env_params = list(min_value = 11.5, max_value = 20.5, sigma_env = 0.1, start_t = 31))
#plot_sim_ts(eg1, burn = 1:30, years_to_show = 70)
#######
#######

# TODO this is temporary; fix it:
plans_mv_arma_n <- plans_mv_linear_n 

  # move to list of dataframes instead of list of list of dataframes
  # this is to match the typical output with even population numbers
  # across runs
  plans_mv_arma_n_dfs <- list() 
  #plans_mv_linear_n_dfs <- list() 
  for(i in 1:length(w)) {
    plans_mv_arma_n_dfs[[i]] <- list() 
    for(j in 1:n_trials) {
      plans_mv_arma_n_dfs[[i]][[j]] <- plans_mv_arma_n[[i]][[j]][[1]]
    #plans_mv_linear_n_dfs[[i]] <- plans_mv_linear_n[[i]][[1]]
    }
  }
  for(i in 1:length(w)) {
    plans_mv_arma_n_dfs[[i]] <- do.call("rbind", plans_mv_arma_n_dfs[[i]])
  }
  #save(plans_mv_arma_n_dfs, plans_mv_linear_n_dfs, file = "plans_mv_n.rda")
  #save(plans_mv_arma_n_dfs, file = "plans_mv_n.rda")
#}

source("plot_cons_plans.R")
#par(mfrow = c(1, 2))
par(mfrow = c(1, 1))
require(RColorBrewer)
#cols <- brewer.pal(6, "RdYlGn")
cols <- brewer.pal(6, "Spectral")
par(cex = 0.7, mar = c(4,5,0,0), oma = c(.5,.5,.5,.5), mgp = c(3, .5, 0), tck = -0.01, las = 1)
j <- plot_cons_plans(plans_mv_arma_n_dfs, plans_name, cols = cols, add_all_efs = TRUE)
#plot_cons_plans(plans_mv_linear_n_dfs, plans_name, cols = cols, xlim = j$xlim, ylim = j$ylim, add_all_efs = TRUE)

