#' Get quantile contour
get_quantile_contour <- function(x, alpha = 0.8) {
  zdens <- rev(sort(x$z))
  Czdens <- cumsum(zdens)
  Czdens <- (Czdens/Czdens[length(zdens)])
  crit.val <- zdens[max(which(Czdens<=alpha))]    
  b.full=contourLines(x,levels=crit.val)
  list(x = b.full[[1]]$x, y = b.full[[1]]$y)
}

#' Add a kernel density polygon
add_dens_polygon <- function(x, y, col, lwd = 1, alpha = 0.7, add_pts = FALSE) {
  k <- get_quantile_contour(MASS::kde2d(x,y), alpha = 0.75)
  polygon(k$x, k$y, border = col, col = paste(col, "30", sep = ""), lwd = lwd)
  k <- get_quantile_contour(MASS::kde2d(x,y), alpha = 0.25)
  polygon(k$x, k$y, border = col, col = paste(col, "70", sep = ""), lwd = lwd)
  if(add_pts) points(x, y, pch = 20, col = paste(col, "60", sep = ""))
}

#' Get the efficient frontier from mean and variance values
get_efficient_frontier <- function(m, v) {
  d <- data.frame(m = m, v = v)
  ef_front <- d[chull(d$v, d$m), ]

  ef_front <- ef_front[order(ef_front$m), ]
  ef_front_top <- ef_front[which.min(ef_front$v):nrow(ef_front), ]
  ef_front_bottom <- ef_front[1:(which.min(ef_front$v) - 1), ]

  # order by risk
  ef_front_top <- ef_front_top[order(ef_front_top$v), ]
  ef_front_bottom <- ef_front_bottom[order(-ef_front_bottom$v), ]

  # remove where return is coming back down or back up:
  ef_front_top <- ef_front_top[1:which.max(ef_front_top$m),]
  ef_front_bottom <- ef_front_bottom[which.min(ef_front_bottom$m):nrow(ef_front_bottom),]
  return(rbind(ef_front_bottom, ef_front_top))
}

#' Plot conservation plans in mean-variance space
#' @export
plot_cons_plans <- function(plans_mv, plans_name, cols, xlim = NULL,
  ylim = NULL, add_pts = TRUE, add_all_efs = FALSE, x_axis = TRUE,
  y_axis = TRUE, add_legend = TRUE, w_show = "all", xlab = "Variance of
    generation-to-generation\nrate of change", ylab = "Mean of
    generation-to-generation\nrate of change") {

  if(w_show[1] == "all") w_show <- seq_along(plans_name)


  if(is.null(xlim)) {
    lims <- ldply(plans_mv, function(x) data.frame(x.max = max(x$v), x.min
        = min(x$v), y.max = max(x$m), y.min = min(x$m)))
    xlim = c(min(lims$x.min), max(lims$x.max)*0.8)
    ylim = c(min(lims$y.min), max(lims$y.max))
  }

  plot(1, 1, xlim = xlim, ylim = ylim, type = "n", xlab = xlab, ylab = ylab, axes = FALSE)
    box(col = "grey50")
    if(x_axis) axis(1, col=  "grey50")
    if(y_axis) axis(2, col=  "grey50")

    for(i in w_show) {
      add_dens_polygon(plans_mv[[i]]$v, plans_mv[[i]]$m, col = cols[i],
        add_pts = add_pts)
    }
    if(add_legend) {
    legend("topright", legend = plans_name[w_show], fill =
      paste(cols[w_show], "80", sep = ""), bty = "n", cex = 0.9)
    }

    mv_all <- do.call("rbind", plans_mv)

    ef_front_pts <- with(mv_all, get_efficient_frontier(m = m, v = v))
    with(ef_front_pts, lines(v, m, col = "grey50", lwd = 2.2))

    if(add_all_efs) {
      for(i in w_show) {
        ef_front_pts_i <- with(plans_mv[[i]], get_efficient_frontier(m =
            m, v = v))
        with(ef_front_pts_i, lines(v, m, col = cols[i], lwd = 2.2))
      }
    }
    invisible(list(xlim = xlim, ylim = ylim))
}

