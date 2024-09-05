#' Compute category probabilities using the GRM
#'
#' @inheritParams p_gpcm
#'
#' @return A numeric vector of probabilities to respond in categories
#' c = 0, ..., m
#' @export
#' @examples
#' p_grm(theta = 1, alpha = 1.2, delta = c(-2, -0.5, 1.5))
#'

p_grm <- function (theta, alpha, delta) {

  checkmate::assert_numeric(delta, sorted = TRUE)

  p_step <- p_step_grm(theta = theta, alpha = alpha, delta = delta)

  p_grm <- rep(NA, length(p_step)-1)
  for (i in 1:(length(p_step)-1)) p_grm[i] <- p_step[i] - p_step[i+1]

  return(p_grm)

}
