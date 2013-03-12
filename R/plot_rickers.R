#' Plot sample ricker curves for each stock
#' 
#' @param x Output list from \code{meta_sim}
#' @param pal Colours for stocks
#' @param n_samples Number of sample lines to draw from the a parameters
#' @param add_y_axes_pops Panels to add y axes on
#' @param add_x_axes_pops Panels to add x axes on
#' @param burn Number of initial years to throw out as burnin
#' 
plot_rickers <- function(
  x,  # sim output list
  pal, # colour palette
  n_samples = 40, # number of sample lines to draw from the a parameters
  add_y_axes_pops = c(1, 6), # panels to add y axes on
  add_x_axes_pops = c(6:10), # panels to add y axes on
  burn = 1:30 # burn in year to throw out
){
  
  esc.lower <- apply(x$E[-burn, ], 2, min)
  esc.upper <- apply(x$E[-burn, ], 2, max)
  
  #buffer <- (esc.upper - esc.lower) * .5
  
  #sp <- seq(max(esc.lower - buffer, 0), esc.upper + buffer, length.out = 100)
  sp <- list()
  for(j in 1:x$n_pop) {
    buffer <- (esc.upper[j] - esc.lower[j]) * .02
    sp[[j]] <- seq(max(esc.lower[j] - buffer, 0), esc.upper[j] + buffer, 
      length.out = 100)
  }
  min_sp <- min(as.numeric(lapply(sp, min)))
  max_sp <- max(as.numeric(lapply(sp, max)))
  
  source("ricker_ar1.R")
  library(colorspace)
  env_vals <- seq(min(x$env_ts), max(x$env_ts), length.out = 20)
  env_cols <- diverge_hcl(20)[findInterval(x$env_ts, env_vals)]
  
  samples <- sample(seq((max(burn)+1),x$n_t), n_samples) 
  
  rickers_to_plot <- list()
  for(j in 1:x$n_pop){
    rickers_to_plot[[j]] <- matrix(ncol = length(samples), nrow = 
        length(sp[[1]]))
  }
  
  for(j in 1:x$n_pop) {
    for(i in 1:length(samples)){
      #rickers_to_plot[[j]][ , i] <- ricker_ar1(spawners = sp[[j]], 
      # a = x$A_params[samples[i], j], b = x$b[j])$recruits
      rickers_to_plot[[j]][ , i] <- ricker_ar1(spawners = seq(min_sp, max_sp, 
        length.out = 100), a = x$A_params[samples[i], j], b = x$b[j])$recruits
    }
  }
  
  y_max <- max(unlist(lapply(rickers_to_plot, function(x) max(x))))
  y_min <- min(unlist(lapply(rickers_to_plot, function(x) min(x))))
  
  par(mfrow = c(ceiling(x$n_pop/5), 5), cex = 0.7, mar = c(0,0,0,0), 
    oma = c(4, 4,.5,.5), las = 1)
  for(j in 1:x$n_pop) {
    
    #esc.lower <- min(x$E[-burn, j])
    #esc.upper <- max(x$E[-burn, j])
    
    a_to_plot <- x$A_params[samples, j]
    
    env_cols_to_plot <- env_cols[samples]
    
    #rickers_to_plot <- matrix(nrow = length(a_to_plot), ncol = length(sp))
    
    #for(i in 1:length(a_to_plot)){
    #rickers_to_plot[i, ] <- ricker_ar1(spawners = sp, a = a_to_plot[i], b = x$b[j])$recruits 
    #}
    
    plot(1, 1, xlim = c(min_sp, max_sp), ylim = c(y_min, y_max), type= "n", xlab = "", ylab = "", axes = FALSE)
    box(col = "grey50") 
    if(j %in% add_y_axes_pops) axis(2)
    if(j %in% add_x_axes_pops) axis(1)
    for(i in 1:ncol(rickers_to_plot[[j]])){
      #lines(sp[[j]], rickers_to_plot[[j]][,i], col = env_cols_to_plot[i])
      lines(seq(min_sp, max_sp, length.out = 100), rickers_to_plot[[j]][,i], col = env_cols_to_plot[i])
    }
    rect(esc.lower[j], 0, esc.upper[j], y_max*1.1, border = NA, col = "#00000050") 
    mtext(j, adj = 0.05, line = -1.5, cex = 0.9, col = pal[j])
    
  }
  mtext("Spawners", side = 1, outer = TRUE, line = 2.3)
  mtext("Returns", side = 2, outer = TRUE, line = 2.3, las = 0)
}
