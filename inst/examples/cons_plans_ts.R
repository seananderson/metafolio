#' 

#### now show ts in one case:
set.seed(3)
library(doMC)
registerDoMC()
getDoParWorkers()
system.time({
weights_matrix <- create_asset_weights(n_pop = 10, n_sims = 100, weight_lower_limit = 0.001)
mc_ports <- monte_carlo_portfolios_foreach(weights_matrix = weights_matrix,
  n_sims = 100, mean_b = 1000, add_impl_error = FALSE, start_assessment = 30, assess_freq = 150)
})
    cons_plan <- list()
for(j in w_show) {
   cons_plan[[j]] <- meta_sim(b = w[j, ], use_cache = TRUE, 
     n_pop = 10, add_impl_error = FALSE, start_assessment = 30, assess_freq = 150)
}

#pdf("cons_plans_wave_ts_warming.pdf", width = 6, height = 5.2)
par(mfrow = c(1, 1), cex = 0.7, mar = c(0, 5, 0, 1), oma = c(4, 0,1,0), tck = -0.04, mgp = c(2, 0.7, 0), xpd = FALSE)
burn <- 1:65
A_range <- ldply(mc_ports, function(x) range(rowSums(x$A[-burn, ])))
ret_range <- ldply(mc_ports, function(x) range(diff(log(rowSums(x$A[-burn, ])))))
  this.port <- mc_ports[[1]]
  port.x <- rowSums(this.port$A[-burn, ])

#plot(port.x, type = "n", xaxt = "n", ylim = range(ret_range), ylab = "Generation rate of change of\nmetapopulation abundance", xlab = "")
#abline(h = 0, lty = 1, col = "#00000040", lwd = 2)
#for(i in sample(1:length(mc_ports), 100)){
  #this.port <- mc_ports[[i]]
  #port.x <- rowSums(this.port$A[-burn, ])
  #ret.x <- diff(log(port.x))
  #lines(1:length(ret.x), ret.x, type = "l", col = "#74747430", lwd = 0.5)
#}

#for(i in rev(w_show)){
  #x <- cons_plan[[i]]$A[-burn, ]
  #port.x <- rowSums(x)
  #ret.x <- diff(log(port.x))
  #lines(1:length(ret.x), ret.x, col = cols[i], lwd = 2, lty = i)
#}

#abundance?
plot(port.x, type = "n", ylim = range(A_range), ylab = "Metapopulation abundance", xlab = "Generation")
for(i in sample(1:length(mc_ports), 100)){
  this.port <- mc_ports[[i]]
  port.x <- this.port$A[-burn, ]
  port.x <- rowSums(this.port$A[-burn, ])
  lines(1:length(port.x), port.x, type = "l", col = "#74747430", lwd = 0.5)
}

for(i in rev(w_show)){
  x <- cons_plan[[i]]$A[-burn, ]
  port.x <- rowSums(x)
#print(port.x);print(i)
  ret.x <- diff(log(port.x))
  lines(1:length(port.x), port.x, col = cols[i], lwd = 2, lty = i)
}

legend("bottomright", legend = plans_name[w_show], col = paste(cols[w_show], "", sep = ""), bty = "n", cex = 0.9, lty = w_show, lwd = 2)
#dev.off()


