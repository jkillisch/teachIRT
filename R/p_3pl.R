#' Compute the probability to solve an item using the 3PL model
#'
#' @inheritParams p_2pl
#' @param gamma Numeric, guessing parameter
#'
#' @return A numeric probability to solve the item
#' @export
#' @examples
#' p_3pl(theta = -5, alpha = 1, beta = 0.5, gamma = 0.3)
#'

p_3pl <- function (theta, alpha, beta, gamma) {

  checkmate::assert_number(gamma, lower = 0, upper = 1)

  p <- gamma + (1 - gamma) * p_2pl(theta, alpha, beta)
  checkmate::assert_number(p, lower = 0, upper = 1)
  return(p)

}
