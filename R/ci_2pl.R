#' Compute a confidence interval around a person parameter using the 2PL model
#' 
#' If beta and alpha are vectors, the test information is used for the 
#' confidence interval.
#' 
#' @inheritParams p_2pl
#' @inheritParams get_z
#' 
#' @return Two-element numeric vector, limits of the confidence interval
#' @export
#' @examples
#' ci_2pl(
#'   theta = 0.5,
#'   alpha = c(0.5, 1.2, 1),
#'   beta = c(-0.5, 1, 2),
#'   ci_alpha = 0.05,
#'   ci_direction = "both"
#' )

ci_2pl <- function (theta, alpha, beta, ci_alpha, ci_direction) {
  
  stopifnot(
    "alpha and beta must have the same lengths" =
    length(beta) == length(alpha)
    )
  
  inf <- mapply(inf_2pl, alpha = alpha, beta = beta, theta = theta)
  inf <- sum(inf)
  
  ci <- ci_general(
    theta = theta,
    inf = inf,
    ci_alpha = ci_alpha,
    ci_direction = ci_direction
  )
  
  return(ci)
  
}