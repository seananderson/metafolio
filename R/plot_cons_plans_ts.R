#' Plot conservation plan abundance time series panel
#'
#' @param x A \code{\link{meta_sim}} output object.
plot_cons_plans_ts_panel <- function(x) {
  plot(1,1,ylim = range(A_range_n), xlim=  c(1, 70), type = "n", xlab = "", ylab = "", xaxt = "n")
for(i in 3:4){
  x <- cons_n_ts[[i]]$A[-burn, ]
  port.x <- rowSums(x)
  lines(1:length(port.x), port.x, col = cols[i], lwd = 1, lty = 1)
}
  
}



#' Plot time series of abundance from conservation plans
#'
#' @param x A list of output from \code{\link{meta_sim}}
#' @export
plot_cons_plans_ts <- function(x, burn = 1:30) {

  A_range <- plyr::ldply(cons_sp_ts, function(x) range(rowSums(x$A[-burn, ])))

}


