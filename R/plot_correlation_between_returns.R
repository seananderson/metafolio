#' Plot correlation of returns across stocks.
#' 
#' @param x A list output object from \code{meta_sim}.
#' @param burn Number of years to discard at start as burnin.
#' @param pal Colours to plot with for stocks.

plot_correlation_between_returns <- function(x, burn = 1:30, pal = gg_color_hue(x$n_pop)) {
  # x is output from a simulation run

par(mfrow = c(10, 10), cex = 0.5, mar = c(0,0,0,0), oma = c(4, 4, 0, 0))
for(i in 1:10) {
  for(j in 1:10) {
    if(j < i){ plot(x$A[-burn, i], x$A[-burn, j], log = "xy", axes = FALSE, pch = 20, col = "grey20")
    box(col = "grey50")
    }else{ 
      plot(1,1, type = "n", xlab = "", ylab = "", axes = FALSE)
    }
    if(i == 10) mtext(j, side = 1, line = 1, cex = 0.8, col = pal[j])
    if(j == 1) mtext(i, side = 2, las = 1, line = 1, cex = 0.8, col = pal[i])
  }
}
    mtext("log of returns by subpopulation", side = 1, line = 2.5, cex = 0.8, outer = TRUE)
    mtext("log of returns by subpopulation", side = 2, line = 2.5, cex = 0.8, outer = TRUE, las = 0)

}
