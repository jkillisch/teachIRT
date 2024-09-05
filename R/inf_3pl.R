#' Compute information at theta using the 3PL model
#'
#' @inheritParams p_3pl
#'
#' @return Numeric, information
#' @export
#' @examples
#' inf_3pl(theta = 0, alpha = 1, beta = 0.5, gamma = 0.3)

inf_3pl <- function (theta, alpha, beta, gamma) {

  p <- p_3pl(theta, alpha, beta, gamma)
  inf <- alpha^2*((1-p) / p)*((p-gamma)^2/(1-gamma)^2)

  return(inf)

}
