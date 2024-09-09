#' Compute the blockwise dependent probability to prefer the first item over the 
#' second in a forced-choice pair using the Thurstonian IRT (TIRT) model
#'
#' @param theta Numeric vector of length 2, latent ability
#' @param mu Numeric vector of length 2, item means
#' @param lambda Numeric vector of length 2, factor loadings
#' @param psi2 Numeric vector of length 2, residual variance (squared values)
#'
#' @return A numeric probability to prefer the first item over the second
#' @export
#' @examples
#' p_tirt(
#'   theta = c(0, 0), 
#'   mu = c(0, -0.2), 
#'   lambda = c(0.7, 0.8), 
#'   psi2 = c(1, 1)
#'   )

p_tirt <- function (theta, mu, lambda, psi2) {
  
  checkmate::assert_numeric(
    theta,
    finite = TRUE,
    any.missing = FALSE,
    len = 2,
    null.ok = FALSE
    )
  
  checkmate::assert_numeric(
    mu,
    finite = TRUE,
    any.missing = FALSE,
    len = 2,
    null.ok = FALSE
  )
  
  checkmate::assert_numeric(
    lambda,
    finite = TRUE,
    any.missing = FALSE,
    len = 2,
    null.ok = FALSE
  )
  
  checkmate::assert_numeric(
    psi2,
    finite = TRUE,
    any.missing = FALSE,
    len = 2,
    null.ok = FALSE
  )
  
  lin <- mu[1] - mu[2] + lambda[1] * theta[1] - lambda[2] * theta[2]
  lin <- lin / sqrt(psi2[1] + psi2[2])
  p_tirt <- pnorm(lin)
  
  return(p_tirt)
  
}