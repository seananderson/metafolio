# plot time series from the simulation
# just the annual rate of growth and returns in this one

plot_sim_ts_simple <- function(x, pal = rev(gg_color_hue(x$n_pop)), burn = 1:60, text = "Returns") {
# x is output from a simulation run; it's a list
# pal is the colour palette

to_show <- (max(burn)):(max(burn)+40) # years to show in time series example plots

annotate <- function(text) {
  text(par("usr")[1], par("usr")[4] - (par("usr")[4] - par("usr")[3]) * 0.18, text, cex = 1, pos = 4)
}
#my.axis <- function(side) axis(side, col = "grey50", at = c(2000, 4000))

#par(mfrow = c(8, 1), mar = c(0,0,0,0), oma = c(4, 4, 1, 1), cex = 0.7, las = 1, xpd = FALSE)
# returns:

matplot(x$A[to_show, ], type = "l", col = pal, lty = 1, ylab = "", xlab = "Time", xaxt = "n", axes = FALSE, xaxs = "i", ylim = c(0, 6000))
annotate(text)
box(col = "grey50")
#my.axis(2)

#my.axis(1)

}

