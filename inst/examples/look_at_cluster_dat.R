#' 


load("cluster_dat/min_var_weights_10pops_40mpt.rda")

 #matplot(t(log(min_var_weights)), type = "l")
 #matplot(t(min_var_weights/10000*100), type = "l", ylab = "Percentage of total habitat")
 #abline(h = 1/10*100, lwd = 2, col = "grey50")

## plotting
 #matplot(t(min_var_weights/10000*100), type = "l", ylab = "Percentage of total habitat", col = "#00000050", lty = 1, lwd = 1.5)
 #abline(h = 1/10*100, lwd = 2, col = "grey50")
#par(mfrow = c(6, 2), cex = 0.7, mar = c(0,0,0,0));for(i in 1:12) acf(min_var_weights[i, ])
#ar1 <- apply(min_var_weights, 1, function(x) {
  #m <-arima(x, order = c(1, 0,0))
  #as.numeric(coef(m)[1])
    #})
#hist(ar1)
##plot(density(ar1))

par(mfrow = c(6, 5), mar = c(0,0,0,0), oma = c(4, 4, .5, .5), cex = 0.7);for(i in 1:30) {
  plot(min_var_weights[i,]/100, type = "l", axes = FALSE, ylim = c(1, 20))
  box(col = "grey50")
  abline(h = 10, col = "grey70", lty = 2)
  if(i %in% seq(1, 26, 5)) axis(2, col = "grey50", las = 1)
  if(i %in% seq(26, 30)) axis(1, col = "grey50", las = 1)
}
mtext("Carrying capacity weight (percentage)", side = 2, outer = TRUE, line = 2.5)
mtext("Population", side = 1, outer = TRUE, line = 2.5)
## what is the variance of the even weighted portfolio compared to the minimum 
## variance portfolio?
#plot(jitter(rep(1, length(minv_cv))), minv_cv/eq_weight_cv, xlim = c(0.8, 1.2))
#hist(minv_cv/eq_weight_cv)

