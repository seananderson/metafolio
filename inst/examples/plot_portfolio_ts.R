
par(mfrow = c(2, 1), cex = 0.7, mar = c(0, 5, 0, 1), oma = c(4, 0,1,0), tck = -0.04, mgp = c(2, 0.7, 0), xpd = NA)
burn <- 1:30
port.x <- rowSums(min_var_sim$A[-burn, ])
ret.x <- diff(log(port.x))

require(plyr)
A_range <- ldply(mc_ports$sims_out, function(x) range(rowSums(x$A[-burn, ])))
ret_range <- ldply(mc_ports$sims_out, function(x) range(diff(log(rowSums(x$A[-burn, ])))))

plot(ret.x, type = "n", xaxt = "n", ylim = range(ret_range), ylab = "Generation rate of change of\nmetapopulation abundance", xlab = "")

#for(i in ef_dat$ef_port_ids){
  #this.port <- mc_ports$sims_out[[i]]
  #port.x <- rowSums(this.port$A[-burn, ])
  #ret.x <- diff(log(port.x))
  #lines(1:length(ret.x), ret.x, type = "l", col = "#44444440")
#}

# all!
for(i in sample(1:length(mc_ports$sims_out), 100)){
  this.port <- mc_ports$sims_out[[i]]
  port.x <- rowSums(this.port$A[-burn, ])
  ret.x <- diff(log(port.x))
  lines(1:length(ret.x), ret.x, type = "l", col = "#44444440")
}
port.x <- rowSums(min_var_sim$A[-burn, ])
ret.x <- diff(log(port.x))
#lines(1:length(ret.x), ret.x, lwd = 1.7, col = "#4F69FF")
lines(1:length(ret.x), ret.x, lwd = 2.5, col = "white")

# abundance?
port.x <- rowSums(min_var_sim$A[-burn, ])
plot(port.x, type = "n", ylim = range(A_range), ylab = "Metapopulation abundance", xlab = "Generation")

for(i in sample(1:length(mc_ports$sims_out), 100)){
  this.port <- mc_ports$sims_out[[i]]
  port.x <- this.port$A[-burn, ]
  port.x <- rowSums(this.port$A[-burn, ])
  lines(1:length(port.x), port.x, type = "l", col = "#44444440")
}

port.x <- rowSums(min_var_sim$A[-burn, ])
#ret.x <- diff(log(port.x))
#lines(1:length(port.x), port.x, lwd = 1.7, col = "#4F69FF")
lines(1:length(port.x), port.x, lwd = 2.5, col = "white")

# pull out EF and plot the portfolios

