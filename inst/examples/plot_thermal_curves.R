# plot thermal curves across populations as an example

par(cex = 0.8, mgp = c(2.4, 0.65, 0), tck = -0.02)
optim_temps <- seq(13, 19, length.out = 10)
x <- seq(3, 29, length.out = 200)
plot(1, 1, xlim = c(4, 28), ylim = c(-0.01, 1.4), ylab = "Ricker productivity parameter (a)", xlab = expression(Temperature~(degree*C)), type = "n", yaxs = "i", las = 1)
for(i in 1:10) {
  lines(x, thermal_curve_a(x, optim_temp = optim_temps[i], max_a = 1.3, width_param = 0.02), ylab = "a", xlab = "Temperature", type = "l", col = col_pal[i], lwd = 1.5)
}


