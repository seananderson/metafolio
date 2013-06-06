#' @export
add_inset_env <- function(env, x = 0.12, y = -0.013, size = c(1, .5), ...) {
  TeachingDemos::subplot(plot(seq(0.1, 0.15, length.out =
        length(env)), env, axes = FALSE, ann = FALSE, type =
      "l", col = "grey10"), x = x, y = y, size = size, ...)
  par(xpd = NA)
  text(x, y, "Environment", adj = c(.5, 3.0), col = "black", cex = 1)
  par(xpd = FALSE)
}


