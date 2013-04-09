#' 

get_port_vals <- function(x, burn = 1:30) {
    port.x <- rowSums(x$A[-burn, ])
    ret.x <- diff(log(port.x))
    var.x <- var(ret.x)
    mean.x <- mean(ret.x)
    data.frame(m = mean.x, v = var.x)
}

