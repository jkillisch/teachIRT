#' Compute a confidence interval around a person parameter using the Rasch model
#' 
#' If beta is a vector, the test information is used for the confidence
#' interval.
#' 
#' @inheritParams p_rasch
#' @inheritParams get_z
#' 
#' @return Two-element numeric vector, limits of the confidence interval
#' @export
#' @examples
#' ci_rasch(
#'   theta = 0.5,
#'   beta = c(-1.2, 0, 2),
#'   ci_alpha = 0.05,
#'   ci_direction = "both"
#' )

ci_rasch <- function (theta, beta, ci_alpha, ci_direction) {
  
  inf <- sapply(beta, inf_rasch, theta = theta)
  inf <- sum(inf)
  
  ci <- ci_general(
    theta = theta,
    inf = inf,
    ci_alpha = ci_alpha,
    ci_direction = ci_direction
  )
  
  return(ci)
  
}