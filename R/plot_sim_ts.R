#' Plot various time series from a simulation runn
#' 
#' @param x A list output object from a simulation run.
#' @param years_to_show How many years to plot after the burn in period.
#' @param burn The number of years to discard as burnin a the beginning of the time 
#' series.
#' @export

plot_sim_ts <- function(x, pal = rev(gg_color_hue(x$n_pop)), years_to_show = 30, burn = 1:50) {
# x is output from a simulation run; it's a list
# pal is the colour palette

#plot(1:6, col = pal, cex = 2,pch = 20) 

to_show <- (max(burn)):(max(burn)+years_to_show) # years to show in time series example plots

annotate <- function(text) {
  mtext(text, side = 3, line = -1.5, cex = 0.7, adj = 0.05)
}
my.axis <- function(side) axis(side, col = "grey50")

par(mfrow = c(10, 1), mar = c(0,0,0,0), oma = c(4, 4, 1, 1), cex = 0.7, las = 1, xpd = FALSE)
# returns:
matplot(x$A[to_show, ], type = "l", col = pal, lty = 1, ylab = "Returns", xlab = "Time", xaxt = "n", axes = FALSE, xaxs = "i")
annotate("Returns")
box(col = "grey50")
my.axis(2)

# Ricker a values:
matplot(x$A_params[to_show, ], type = "l", col = pal, lty = 1, ylab = "Returns", xlab = "Time", axes = FALSE, xaxs = "i")
box(col = "grey50")
my.axis(2)
annotate("Productivity parameter")

# environmental signal
plot(x$env_ts[to_show], type = "l", xaxs = "i", axes = FALSE)
box(col = "grey50")
abline(h = 0, lty = 2, lwd = 1.5, col = "grey50")
annotate("Environmental signal")
my.axis(2)

# strays leaving
matplot(x$Strays_leaving[to_show, ], type = "l", col = pal, lty = 1, ylab = "Returns", xlab = "Time", axes = FALSE, xaxs = "i")
box(col = "grey50")
my.axis(2)
annotate("Strays leaving")

matplot(x$Strays_joining[to_show, ], type = "l", col = pal, lty = 1, ylab = "Returns", xlab = "Time", axes = FALSE, xaxs = "i")
box(col = "grey50")
my.axis(2)
annotate("Strays joining")

matplot(x$F[to_show, ], type = "l", col = pal, lty = 1, ylab = "Returns", xlab = "Time", axes = FALSE, xaxs = "i")
box(col = "grey50")
my.axis(2)
annotate("Fisheries catch")

matplot(x$E[to_show, ], type = "l", col = pal, lty = 1, ylab = "Returns", xlab = "Time", axes = FALSE, xaxs = "i")
box(col = "grey50")
my.axis(2)
annotate("Escapement")

matplot(x$Eps[to_show, ], type = "l", col = pal, lty = 1, ylab = "Returns", xlab = "Time", axes = FALSE, xaxs = "i")
box(col = "grey50")
abline(h = 0, lty = 2, lwd = 1.5, col = "grey50")
my.axis(2)
annotate("Spawner-return curve residuals")

matplot(x$Est_a[to_show, ], type = "l", col = pal, lty = 1, ylab = "Estimated a", xlab = "", axes = FALSE, xaxs = "i")
box(col = "grey50")
annotate("Estimated a")
my.axis(2)

matplot(x$Est_b[to_show, ], type = "l", col = pal, lty = 1, ylab = "Estimated b", xlab = "", axes = FALSE, xaxs = "i")
box(col = "grey50")
annotate("Estimated b")
my.axis(2)

my.axis(1)
mtext("Generation", side = 1, outer = TRUE, line = 2.0, cex = 0.8)
#browser()

}

