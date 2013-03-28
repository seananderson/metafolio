# plot example temperature time series

types <- c("sine", "arma", "regime", "linear", "constant")
x <- list()
for(i in 1:5) x[[i]] <- generate_env_ts(n_t = 100, type = types[i])
op <- par(mfrow = c(5, 1), mar = c(0,0,0,0), cex = 0.8, oma = c(3.1, 3.2, .5, 5), xpd = NA, mgp = c(2.5, 0.7, 0), tck = -0.06, las = 1) 
for(i in 1:5) {
  plot(x[[i]], type = "l",  axes = FALSE, ylim = c(-1.2, 1.12), xlab = "", ylab = "")
  mtext(types[i], adj = 0.05, cex = 0.8, line = -1.5)
  axis(2, at = c(-1, 0, 1), col = "grey50")
  box(col = "grey50")
}
axis(1, col = "grey50")
mtext("Generation", side = 1, line = 2.2, outer = TRUE)
mtext("Anomaly", side = 2, line = 2.2, outer = TRUE, las = 0)
par(op)

