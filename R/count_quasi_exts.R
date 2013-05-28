#' Take \code{\link{meta_sim}} output objects and count quasi
#' extinctions
#'
#' @param dat Input data. Should be a list of lists. The first level
#' corresponds to the conservation plan and the second level
#' corresponds to the replicate.
#' @param quasi_thresh
#' @param ignore_pops_thresh
#' @param duration 
#' @return
#' A list of matrices. The list elements correspond to the
#' conservation plans. The columns of the matrix correspond to the
#' subpopulations that were above the \code{ignore_pops_thresh} level.
#' The rows of the matrix correspond to the replicates.
#' @export
#' @examples \dontrun{
#' count_quasi_exts(x_arma_sp$plans_port, quasi_thresh = 200)
#'}

count_quasi_exts <- function(dat, quasi_thresh, ignore_pops_thresh = 5, 
  duration = 1) {
  subpop_qe <- plyr::llply(dat, function(x) {
    plyr::laply(x, function(y) {
      conserved_pops <- which(y$A[1, ] > ignore_pops_thresh)
      out <- apply(y$A[, conserved_pops], 2, function(z) {
        temp <- is_quasi_ext(z, thresh = quasi_thresh, duration = duration)$first_qe
        temp
      })
      out
    })
  })
  return(subpop_qe)
}

