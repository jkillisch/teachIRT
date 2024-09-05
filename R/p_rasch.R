#' Compute the probability to solve an item using the Rasch model
#'
#' @param theta Numeric, latent ability
#' @param beta Numeric, item difficulty
#'
#' @return A numeric probability to solve the item
#' @export
#' @examples
#' p_rasch(theta = 3, beta = 2)

p_rasch <- function (theta, beta) {

  p <- plogis(lin(theta, alpha = 1, beta))
  checkmate::assert_number(p, lower = 0, upper = 1)
  return(p)

}
