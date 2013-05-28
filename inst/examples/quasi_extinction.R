#' Develop quasi-extinction concept

# First experiment with a single run:
#require(plyr)
#w1 <- structure(c(5, 1000, 5, 1000, 5, 5, 1000, 5, 1000, 5), .Dim = c(1L, 10L))

#arma_env_params <- list(mean_value = 16, ar = 0.1, sigma_env = 2, ma = 0)

#x <- meta_sim(b = w1, n_pop = 10, env_params = arma_env_params, env_type = "arma", assess_freq = 5, sigma_v = 0.6)

#conserved_pops <- which(x$A[1, ] > 5)
#subpop_qe <- adply(x$A[, conserved_pops], 2, function(y) {
  #temp <- is_quasi_ext(y, thresh = 200, duration = 1)
  #with(temp, data.frame(is_qe = is_qe, first_qe = first_qe))
#})

#meta_qe <- is_quasi_ext(rowSums(x$A), thresh = 200*4, duration = 1)
#print(meta_qe)
#print(subpop_qe)

# OK, now bring in the raw simulation output and run this for multiple
# scenario weights and across replicates.

# The data are saved in, for example, x_arma_sp.rda and
# x_linear_sp.rda for the spatial plans.

# Specifically, x_arma_sp$plans_port[[1]][[1]] contains the simulation
# output from the first weight scenario and the first replicate.


plot_quasi_extinctions <- function(dat) {

quasi_counts <- count_quasi_exts(dat, quasi_thresh = 200,
  ignore_pops_thresh = 5)

#quasi_counts_linear <- count_quasi_exts(x_linear_sp$plans_port, 200, 5)

#quasi_counts <- quasi_counts_linear

# now translate this into something sensible for plotting:
turn_quasi_to_matrix <- function(x) {
  x[is.na(x)] <- 100
  m <- matrix(nrow = 4, ncol = 100)
  for(i in 1:4) {
    m[i,] <- c(rep(0, x[i]), rep(1, 100-x[i]))
  }
  m
}

# Get the extinction proportion totals by year:
ext_props <- lapply(quasi_counts, function(xx) {
  out <- list()
  for(i in 1:nrow(xx)) {
    out[[i]] <- turn_quasi_to_matrix(xx[i, ])
  }
  temp <- do.call("rbind", out)
  totals <- apply(temp, 2, sum)
  totals/nrow(temp)
})

cols <- RColorBrewer::brewer.pal(5, "Dark2")
ymax <- max(unlist(lapply(ext_props, max)))
#par(mfrow = c(1, 2))
plot(1, 1, ylim = c(0, ymax), xlim = c(0, 100), type = "n", xlab = "Year", ylab = "Cumulative proportion \"quasi-extinct\"", las = 1)
for(i in 1:length(ext_props)) lines(seq_len(100), ext_props[[i]], col = cols[i], lwd = 2.5)

#m1 <- glm(kk/(200*100) ~ seq_len(100), family = quasibinomial, weights = rep(800, 100))
#illogit <- function(x) exp(x)/(1+exp(x))
#p <- predict(m1, type = "response")

}

load("x_arma_sp.rda")
load("x_linear_sp.rda")

pdf("quasi-extinct-4-seed2.pdf", width = 7, height = 4)
par(mfrow = c(1, 2), cex = 0.8)
plot_quasi_extinctions(x_arma_sp$plans_port)
mtext("Short-term variation")
plot_quasi_extinctions(x_linear_sp$plans_port)
mtext("Long-term trend")

plans_name_sp <- c("Full range of responses", "Most stable only", "One half", "One half")
legend("topright", legend = plans_name_sp, col = paste(cols, "",
    sep = ""), bty = "n", cex = 1.0, lty = 1, lwd = 3)
dev.off()
