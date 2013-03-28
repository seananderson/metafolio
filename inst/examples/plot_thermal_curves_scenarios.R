#' plot thermal curves for different conservation scenarios

par(cex = 0.6, mgp = c(2.4, 0.65, 0), tck = -0.02, mfrow = c(5,1), mar = c(0,5,0,.5), oma = c(4, 0, .5, 0))

optim_temps <- seq(13, 19, length.out = 10)

widths <- c(seq(0.05, 0.02, length.out = 5), rev(seq(0.05, 0.02, length.out = 5)))

heights <- c(seq(2.8, 2.2, length.out = 5), rev(seq(2.8, 2.2, length.out = 5)))

x <- seq(3, 29, length.out = 200)

plot_the_curves <- function(ids) {
  plot(1, 1, xlim = c(4, 28), ylim = c(-0.01, 2.9), ylab = "", xlab = "", type = "n", yaxs = "i", las = 1, xaxt = "n")
  for(i in ids) {
    lines(x, thermal_curve_a(x, optim_temp = optim_temps[i], max_a = heights[i], width_param = widths[i]), col = col_pal[i], lwd = 1.5)
  }
}
plot_the_curves(c(2, 4, 7, 9)) 
plot_the_curves(c(4, 5, 6, 7)) 
plot_the_curves(c(1, 2, 3, 4)) 
plot_the_curves(c(7, 8, 9, 10)) 
plot_the_curves(c(1, 2, 9, 10)) 
axis(1)
par(xpd = NA)
mtext("Ricker productivity parameter (a)", side = 2, outer = TRUE, line = -2.2, las = 0, cex = 0.8)
mtext(expression(Temperature~(degree*C)), side = 1, outer = FALSE, line = 2.5, las = 0, cex = 0.8)

#abline(v = 16, lty = 2)
#abline(v = c(16-3.5, c = 16+3.5), lty = 3)


