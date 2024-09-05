#' Compute the probability to solve an item using the 2PL model
#'
#' @inheritParams p_rasch
#' @param alpha Numeric, item discrimination
#'
#' @return A numeric probability to solve the item
#' @export
#' @examples
#' p_2pl(theta = 1.5, alpha = 1, beta = 0.5)
#'

p_2pl <- function (theta, alpha, beta) {

  p <- plogis(lin(theta, alpha, beta))
  checkmate::assert_number(p, lower = 0, upper = 1)
  return(p)

}
