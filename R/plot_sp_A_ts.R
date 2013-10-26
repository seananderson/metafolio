#' @export
plot_sp_A_ts <- function(X, ylim, x_axis = TRUE, y_axis = TRUE, rate = FALSE, lwd = 1.7, y_axis_ticks = NULL, start_new_plots = 1, labels = NULL, burn = 30, ...) {
  #A_range <- ldply(X, function(x) range(rowSums(x$A[-burn, ])))
  burn <- 1:burn
  for(i in 1:4){
    if(i %in% start_new_plots) {
      plot(1,1,ylim = ylim, xlim = c(1, 70), type = "n",
        xlab = "", ylab = "", xaxt = "n", axes = FALSE, yaxs = "i", ...)
      if(!is.null(labels)) {
        #mtext(labels[i], side = 3, line = -1.2, cex = 0.8, adj = 0.02)
        x1 <- par("usr")[1]
        x2 <- par("usr")[2]
        y1 <- par("usr")[3]
        y2 <- par("usr")[4]
        text(x1 + (x2-x1)*0.005, y2 - (y2-y1)*0.17, labels = labels[i], pos = 4)
      }
    if(y_axis)  {
      if(is.null(y_axis_ticks)) {
        axis(2, col=  "grey50", at = pretty(axTicks(2), n = 2))
      } else {
        axis(2, col=  "grey50", at = y_axis_ticks)
      }
    }
    }

    x <- X[[i]]$A[-burn, ]
    port.x <- rowSums(x)
    if(!rate) {
    lines(1:length(port.x), port.x, col = cols[i], lwd = lwd, lty = 1)
    } else {
    lines(2:length(port.x), diff(log(port.x)), col = cols[i], lwd = lwd, lty = 1)
    }
    box(col = "grey50")
  }
  if(x_axis)
    axis(1, col=  "grey50")
}


