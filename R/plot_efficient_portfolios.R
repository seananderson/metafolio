#' Basic efficient portfolio plots and return efficient portfolio data.

plot_efficient_portfolios <- function(port_vals, weights_matrix, pal, plot = TRUE) {

  pv <- as.data.frame(port_vals)
  names(pv) <- c("m", "v")
  # let's pull out the efficient frontier:
  m.bins <- seq(min(pv$m), max(pv$m), length.out = 50)
  pv$m.bin <- findInterval(pv$m, m.bins)
  pv$optim_set <- 0
  for(i in unique(pv$m.bin)) {
    pv_to_check <- which(pv$m.bin == i)
    pv[pv_to_check, "optim_set"][which.min(pv[pv_to_check, ]$v)] <- 1
  }

  # those below the min variance port should be ignored:
  # they are not desirable
  #abline(h = pv$m[pv$v == min(pv$v)])
  m_at_min_var_port <- pv$m[pv$v == min(pv$v)]
  pv$optim_set[pv$m < m_at_min_var_port] <- 0

  pv$id <- 1:nrow(pv)
  pv <- pv[order(pv$optim_set), ]


  if(plot == TRUE){
    par(mfrow = c(1, 2), xpd = NA)
    par(cex = 0.8)
    with(pv, plot(v, m, pch = 19, col = c("grey50", "red")[optim_set+1], cex = 0.8, xlab = "Variance of metapopulation growth rate", ylab = "Mean of metapopulation growth rate"))
  }
  #library(ggplot2)
  #ggplot(pv, aes(v, m, colour = optim_set)) + geom_point()

  pv <- pv[order(pv$v), ]
  # efficient frontier portfolios
  ef_ports <- pv[pv$optim_set == 1, "id"]
  #ef_ports <- which(pv$optim_set == 1)
  #ef_weights <- b_vals_matrix[ef_ports, ]
  ef_weights <- weights_matrix[ef_ports, ]

  if(plot == TRUE){
    barplot(t(100*ef_weights), col = pal,border = "grey50", names.arg = round(pv$v[pv$id %in% ef_ports]*1000, 2), xlab = "Variance (multiplied by 1000)", ylab = "Percentage", las =1)
  }
  #matplot(x = pv$v[pv$id %in% ef_ports], y = ef_weights, col = pal, type = "l", lty = 1)
  invisible(list(pv = pv, ef_port_ids = ef_ports, min_var_port_id = ef_ports[1], ef_weights = ef_weights))
}
