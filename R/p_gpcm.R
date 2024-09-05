#' Compute category probabilities using the GPCM
#'
#' @inheritParams p_2pl
#' @inheritParams p_pcm
#'
#' @return A numeric vector of probabilities to respond in categories
#' c = 0, ..., m
#' @export
#' @examples
#' p_gpcm(theta = 0, alpha = 2, delta = c(-3, -1, 2))
#'

p_gpcm <- function (theta, alpha, delta) {

  checkmate::assert_numeric(delta)

  lin <- sapply(delta, lin, theta = theta, alpha = alpha)
  lin <- c(0, lin)
  lin <- cumsum(lin)

  p <- softmax(lin)

  checkmate::assert_numeric(p, lower = 0, upper = 1)

  return(p)

}
