# plot time series from the simulation
# just the annual rate of growth and returns in this one

plot_sim_ts_simple <- function(x, pal, burn = 1:50, text = "Returns") {
# x is output from a simulation run; it's a list
# pal is the colour palette

to_show <- (max(burn)):(max(burn)+50) # years to show in time series example plots

annotate <- function(text) {
  mtext(text, side = 3, line = -1.5, cex = 0.7, adj = 0.05)
}
my.axis <- function(side) axis(side, col = "grey50", at = c(800, 1200))

#par(mfrow = c(8, 1), mar = c(0,0,0,0), oma = c(4, 4, 1, 1), cex = 0.7, las = 1, xpd = FALSE)
# returns:

matplot(x$A[to_show, ], type = "l", col = pal, lty = 1, ylab = "Returns", xlab = "Time", xaxt = "n", axes = FALSE, xaxs = "i", ylim = c(300, 1550))
annotate(text)
box(col = "grey50")
my.axis(2)

#my.axis(1)

}

