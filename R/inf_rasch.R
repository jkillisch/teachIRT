#' Compute information at theta using the Rasch model
#'
#' @inheritParams p_rasch
#'
#' @return Numeric, information
#' @export
#' @examples
#' inf_rasch(theta = 0.5, beta = 0.4)

inf_rasch <- function (theta, beta) {

  p <- p_rasch(theta, beta)
  inf <- p * (1-p)

  return(inf)

}
