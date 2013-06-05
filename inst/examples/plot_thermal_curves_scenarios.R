#' plot thermal curves for different conservation scenarios

pdf("thermal-curve-scenarios.pdf", width = 2.6, height = 4.7)
par(cex = 0.8, mgp = c(2.4, 0.55, 0), tck = -0.04, mfrow = c(5,1), mar = c(0,3,0,.5), oma = c(3, 0, .5, 0))
    par(las = 1)

optim_temps <- seq(13, 19, length.out = 10)

widths <- c(seq(0.05, 0.02, length.out = 5), rev(seq(0.05, 0.02, length.out = 5)))

heights <- c(seq(2.8, 2.2, length.out = 5), rev(seq(2.8, 2.2, length.out = 5)))
load("max_a_s.rda")
heights <- max_a_s

x <- seq(3, 29, length.out = 200)

plot_the_curves <- function(ids) {
  plot(1, 1, xlim = c(4, 28), ylim = c(-0.01, 3.6), ylab = "", xlab = "", type = "n", yaxs = "i", las = 1, xaxt = "n", yaxt = "n", axes = FALSE)
  axis(2, at = seq(0, 3), col = "grey50")
  box(col = "grey50")
  for(i in ids) {
    a <- thermal_curve_a(x, optim_temp = optim_temps[i], max_a = heights[i], width_param = widths[i])
    a[a<0] <- 0
    lines(x, a, col = col_pal[i], lwd = 1.5)
  }
}

bg.plot <- function(colour = "#00000019") rect(par("usr")[1],
  par("usr")[3], par("usr")[2], par("usr")[4], col = colour, border =
  FALSE)

al <- function(x) {text(3, 3.20, x, pos = 4)}
plot_the_curves(1:10) 
al("(a) All possible tolerance curves")
bg.plot()
plot_the_curves(c(2, 4, 7, 9)) 
al("(b) Conserve full range")
plot_the_curves(c(4, 5, 6, 7)) 
al("(c) Conserve most tolerant")
plot_the_curves(c(1, 2, 3, 4)) 
al("(d) Conserve one half")
plot_the_curves(c(7, 8, 9, 10)) 
al("(e) Conserve other half")
#plot_the_curves(c(1, 2, 9, 10)) 
axis(1, col = "grey50")
par(xpd = NA)
mtext("Ricker productivity parameter (a)", side = 2, outer = TRUE, line = -1.2, las = 0, cex = 0.7)
#mtext(expression(Temperature~(degree*C)), side = 1, outer = FALSE, line = 2.5, las = 0, cex = 0.8)
mtext("Example environmental values", side = 1, outer = FALSE, line = 2.0, las = 0, cex = 0.7)

#abline(v = 16, lty = 2)
#abline(v = c(16-3.5, c = 16+3.5), lty = 3)


dev.off()
