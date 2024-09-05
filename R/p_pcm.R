#' Compute category probabilities using the PCM
#'
#' @inheritParams p_rasch
#' @param delta Numeric vector, threshold parameters
#'
#' @return A numeric vector of probabilities to respond in categories
#' c = 0, ..., m
#' @export
#' @examples
#' p_pcm(theta = 0.5, delta = c(-1, 0, 1))
#'

p_pcm <- function (theta, delta) {

  checkmate::assert_numeric(delta)

  lin <- sapply(delta, lin, theta = theta, alpha = 1)
  lin <- c(0, lin)
  lin <- cumsum(lin)

  p <- softmax(lin)

  checkmate::assert_numeric(p, lower = 0, upper = 1)

  return(p)

}
