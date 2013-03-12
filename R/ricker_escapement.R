#' Assign a salmon escapement target based on a Ricker curve
#' 
#' @details
#' Set escapement according to Hilborn and Walters (1992) p272, Table 7.2. Smsy = b(0.5 - 0.07*a).
#' @param a Ricker productivity parameter.
#' @param b Ricker density-dependent parameter.
#' @references Hilborn, R.W. and Walters, C. 1992. Quantitative fisheries stock assessment: Choice, dynamics, and uncertainty. Chapman and Hall, London.
#' @examples
#' ricker_escapement(1.1, 1000)
ricker_escapement <- function(a, b) {
   b * (0.5 - 0.07 * a)
}
