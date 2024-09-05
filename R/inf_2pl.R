#' Compute information at theta using the 2PL model
#'
#' @inheritParams p_2pl
#'
#' @return Numeric, information
#' @export
#' @examples
#' inf_2pl(theta = 0.5, alpha = 1.2, beta = 1.5)

inf_2pl <- function (theta, alpha, beta) {

  p <- p_2pl(theta, alpha, beta)
  inf <- alpha^2*p*(1-p)

  return(inf)

}
