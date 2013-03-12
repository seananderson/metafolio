
par(mfrow = c(2, 1), cex = 0.8, mar = c(0, 4, 0, 1), oma = c(4, 0,1,0))
burn <- 1:30
port.x <- rowSums(min_var_sim$A[-burn, ])
ret.x <- diff(log(port.x))
plot(ret.x, type = "n", xaxt = "n", ylim = c(min(ret.x)*1.30, max(ret.x)*1.3))

#for(i in ef_dat$ef_port_ids){
  #this.port <- mc_ports$sims_out[[i]]
  #port.x <- rowSums(this.port$A[-burn, ])
  #ret.x <- diff(log(port.x))
  #lines(1:length(ret.x), ret.x, type = "l", col = "#44444440")
#}


# all!
for(i in sample(1:length(mc_ports$sims_out), 80)){
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
plot(port.x, type = "n")
for(i in sample(1:length(mc_ports$sims_out), 70)){
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

