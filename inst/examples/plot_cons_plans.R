#' 

add_dens_polygon <- function(x, y, col, lwd = 1, alpha = 0.7, add_pts = FALSE) {
  source("get_quantile_contour.R")
  require(MASS)
  k <- get_quantile_contour(kde2d(x,y), alpha = 0.75)
  polygon(k$x, k$y, border = col, col = paste(col, "30", sep = ""), lwd = lwd)
  k <- get_quantile_contour(kde2d(x,y), alpha = 0.25)
  polygon(k$x, k$y, border = col, col = paste(col, "70", sep = ""), lwd = lwd)
  if(add_pts) points(x, y, pch = 20, col = paste(col, "60", sep = ""))
}

plot_cons_plans <- function(plans_mv, plans_name, xlim = NULL, ylim = NULL, add_pts = TRUE) {

  if(is.null(xlim)) {
lims <- ldply(plans_mv, function(x) data.frame(x.max = max(x$v), x.min = min(x$v), y.max = max(x$m), y.min = min(x$m)))
  xlim = c(min(lims$x.min), max(lims$x.max)*0.8)
 ylim = c(min(lims$y.min), max(lims$y.max))
  }

#par(cex = 0.8, mar = c(4,5,0,0), oma = c(.5,.5,.5,.5), mgp = c(3, .5, 0), tck = -0.01, las = 1)
plot(1, 1, xlim = xlim, ylim = ylim, type = "n", xlab = "Variance of generation-to-generation\nrate of change", ylab = "Mean of generation-to-generation\nrate of change", axes = FALSE)
box(col = "grey50")
axis(1, col=  "grey50")
axis(2, col=  "grey50")

#require(RColorBrewer)
#cols <- brewer.pal(5, "Dark2")[c(3, 2, 5, 4, 1)]
#cols <- brewer.pal(5, "Dark2")[c(1,2,4,5,3)] 
#cols <- gg_color_hue(5)[c(3, 2, 1, 4, 5)]
#cols <- c(cols, cols[3])
#for(i in 1:length(plans_mv)) {
for(i in w_show) {
  add_dens_polygon(plans_mv[[i]]$v, plans_mv[[i]]$m, col = cols[i], add_pts = add_pts)
}
legend("topright", legend = plans_name[w_show], fill = paste(cols[w_show], "80", sep = ""), bty = "n", cex = 0.9)

mv_all <- do.call("rbind", plans_mv)
ef_front <- mv_all[chull(mv_all$v, mv_all$m), ]
#with(ef_front, points(v, m))

ef_front <- ef_front[order(ef_front$m), ]
ef_front_top <- ef_front[which.min(ef_front$v):nrow(ef_front), ]
ef_front_bottom <- ef_front[1:(which.min(ef_front$v) - 1), ]

# order by risk
ef_front_top <- ef_front_top[order(ef_front_top$v), ]
ef_front_bottom <- ef_front_bottom[order(-ef_front_bottom$v), ]

# remove where return is coming back down or back up:
ef_front_top <- ef_front_top[1:which.max(ef_front_top$m),]
ef_front_bottom <- ef_front_bottom[which.min(ef_front_bottom$m):nrow(ef_front_bottom),]

with(rbind(ef_front_bottom, ef_front_top), lines(v, m, col = "grey50", lwd = 2.2))

invisible(list(xlim = xlim, ylim = ylim))

}
