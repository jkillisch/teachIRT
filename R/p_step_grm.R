#' Compute the probability respond in category c or above using a GRM
#'
#' @inheritParams p_gpcm
#'
#' @return A numeric vector of probabilities to respond in category
#' c = 0, ..., m or above
#' @export
#' @examples
#' p_step_grm(theta = 1, alpha = 1.2, delta = c(-2, -0.5, 1.5))
#'

p_step_grm <- function (theta, alpha, delta) {

  checkmate::assert_numeric(delta, sorted = TRUE)

  p_step <- sapply(delta, p_2pl, theta = theta, alpha = alpha)
  p_step <- c(1, p_step, 0) # By definition

  return(p_step)

}
