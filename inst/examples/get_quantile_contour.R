#' 

get_quantile_contour <- function(x, alpha = 0.8) {
  zdens <- rev(sort(x$z))
  Czdens <- cumsum(zdens)
  Czdens <- (Czdens/Czdens[length(zdens)])
  crit.val <- zdens[max(which(Czdens<=alpha))]    
  b.full=contourLines(x,levels=crit.val)
  list(x = b.full[[1]]$x, y = b.full[[1]]$y)
}

#plot(get_quantile_contour(f1))
#lines(get_quantile_contour(f1, alpha = 0.75))
