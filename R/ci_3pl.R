#' Compute a confidence interval around a person parameter using the 3PL model
#' 
#' If beta, alpha, and gamma are vectors, the test information is used for the 
#' confidence interval.
#' 
#' @inheritParams p_3pl
#' @inheritParams get_z
#' 
#' @return Two-element numeric vector, limits of the confidence interval
#' @export
#' @examples
#' ci_3pl(
#'   theta = 0.5,
#'   alpha = c(1.2, 0.5),
#'   beta = c(-0.5, 1),
#'   gamma = c(0.3, 0.1),
#'   ci_alpha = 0.05,
#'   ci_direction = "both"
#' )

ci_3pl <- function (theta, alpha, beta, gamma, ci_alpha, ci_direction) {
  
  stopifnot(
    "alpha and beta must have the same lengths" =
      length(beta) == length(alpha)
  )
  
  stopifnot(
    "alpha and gamma must have the same lengths" =
      length(beta) == length(gamma)
  )
  
  inf <- mapply(
    inf_3pl, 
    alpha = alpha, 
    beta = beta, 
    gamma = gamma,
    theta = theta
    )
  inf <- sum(inf)
  
  ci <- ci_general(
    theta = theta,
    inf = inf,
    ci_alpha = ci_alpha,
    ci_direction = ci_direction
  )
  
  return(ci)
  
}