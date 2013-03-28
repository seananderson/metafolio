#'  distribution of portfolio weights across runs:

load("cluster_dat/min_var_weights_10pops_40mpt.rda")

library(plyr)

p <- adply(min_var_weights, 2, function(x) data.frame(l = quantile(x/100, 0.25), m = median(x/100), u = quantile(x/100, 0.75)))
p$X1 <- as.numeric(as.character(p$X1))
names(p)[1] <- "pop"

library(ggplot2)
par(cex = 0.8)
with(p, plot(pop, m, type = "l", lwd = 1.5, ylim = c(min(l), max(u)), xlab = "Population", ylab = "Weight", las = 1))
with(p, polygon(c(pop, rev(pop)), c(l, rev(u)), border = NA, col = "#00000030"))
abline(h = 10, lty = 2)


