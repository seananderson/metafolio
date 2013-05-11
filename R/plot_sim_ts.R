#' Add annotations to panel
annotate <- function(text, adj = 0.05) {
  mtext(text, side = 3, line = -1.2, cex = 0.7, adj = adj)
}

#' Add a pretty axis
my.axis <- function(side, shade_years = NULL, ylab = "") {
  if(!is.null(shade_years)) {
    rect(min(shade_years), -100, max(shade_years), 1e9, col =
      "#00000030", border = NA)
  }
  #axis(side, col = "grey50")
  axis(side, col = "grey50", at = pretty(axTicks(2), n= 2))
  par(las = 0)
  mtext(ylab, side = 2, cex = 0.7, line = 3)
  par(las = 1)
}

#' Plot various time series from a simulation runn
#' 
#' @param x A list output object from a simulation run.
#' @param years_to_show How many years to plot after the burn in period.
#' @param burn The number of years to discard as burnin a the beginning of the time 
#' series.
#' @param adj adj parameter to mtext for panel labels
#' @param shade_years Shade some years? Give a vector. Can be used to
#' show burn in period.
#' @export

plot_sim_ts <- function(x, pal = rev(gg_color_hue(x$n_pop)), years_to_show = 30, burn = 1:50, shade_years = NULL, adj = 0.02) {
# x is output from a simulation run; it's a list
# pal is the colour palette

#plot(1:6, col = pal, cex = 2,pch = 20) 

to_show <- (max(burn)):(max(burn)+years_to_show) # years to show in time series example plots


par(mfrow = c(10, 1), mar = c(0,0,0,0), oma = c(4, 4.5, 1, 1), cex = 0.7, las = 1, xpd = FALSE)
par(tck = -0.03, mgp = c(2, .5, 0)) 

# environmental signal
plot(x$env_ts[to_show], type = "l", xaxs = "i", axes = FALSE)
box(col = "grey50")
abline(h = 0, lty = 2, lwd = 1.5, col = "grey50")
annotate("Environmental signal", adj = adj)
my.axis(2, shade_years = shade_years, ylab = "Value")

# Ricker a values:
matplot(x$A_params[to_show, ], type = "l", col = pal, lty = 1, ylab = "Returns", xlab = "Time", axes = FALSE, xaxs = "i", ylim = c(0, max(x$A_params[to_show, ]) * 1.25))
box(col = "grey50")
my.axis(2, shade_years = shade_years, ylab = "Value")
annotate("Productivity parameter", adj = adj)

# returns:
matplot(x$A[to_show, ], type = "l", col = pal, lty = 1, ylab = "Returns", xlab = "Time", xaxt = "n", axes = FALSE, xaxs = "i")
annotate("Returns", adj = adj)
box(col = "grey50")
my.axis(2, shade_years = shade_years, ylab = "#")

# catch
matplot(x$F[to_show, ], type = "l", col = pal, lty = 1, ylab = "Returns", xlab = "Time", axes = FALSE, xaxs = "i")
box(col = "grey50")
my.axis(2, shade_years = shade_years, ylab = "#")
annotate("Fisheries catch", adj = adj)

# escapement
matplot(x$E[to_show, ], type = "l", col = pal, lty = 1, ylab = "Returns", xlab = "Time", axes = FALSE, xaxs = "i")
box(col = "grey50")
my.axis(2, shade_years = shade_years, ylab = "#")
annotate("Escapement", adj = adj)

# strays leaving
matplot(x$Strays_leaving[to_show, ], type = "l", col = pal, lty = 1, ylab = "Returns", xlab = "Time", axes = FALSE, xaxs = "i")
box(col = "grey50")
my.axis(2, shade_years = shade_years, ylab = "#")
annotate("Strays leaving", adj = adj)

# strays joining
matplot(x$Strays_joining[to_show, ], type = "l", col = pal, lty = 1, ylab = "Returns", xlab = "Time", axes = FALSE, xaxs = "i")
box(col = "grey50")
my.axis(2, shade_years = shade_years, ylab = "#")
annotate("Strays joining", adj = adj)

# SR residuals
matplot(x$Eps[to_show, ], type = "l", col = pal, lty = 1, ylab = "Returns", xlab = "Time", axes = FALSE, xaxs = "i")
box(col = "grey50")
abline(h = 0, lty = 2, lwd = 1.5, col = "grey50")
my.axis(2, shade_years = shade_years, ylab = "Value")
annotate("Spawner-return residuals", adj = adj)

matplot(x$Est_a[to_show, ], type = "l", col = pal, lty = 1, ylab = "Estimated a", xlab = "", axes = FALSE, xaxs = "i")
box(col = "grey50")
annotate("Estimated a", adj = adj)
my.axis(2, shade_years = shade_years, ylab = "Value")

matplot(x$Est_b[to_show, ], type = "l", col = pal, lty = 1, ylab = "Estimated b", xlab = "", axes = FALSE, xaxs = "i")
box(col = "grey50")
annotate("Estimated b", adj = adj)
my.axis(2, shade_years = shade_years, ylab = "Value")

  axis(1, col = "grey50")
mtext("Generation", side = 1, outer = TRUE, line = 2.0, cex = 0.8)
#browser()


}

