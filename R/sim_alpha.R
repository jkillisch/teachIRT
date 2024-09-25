#' Sample m item discrimination parameters
#' 
#' All items are assumed to be positively keyed.
#' 
#' \eqn{\boldsymbol{\alpha} \sim N(1, .2)}
#' 
#' @inheritParams sim_beta
#' @return A vector of item discrimination parameters
sim_alpha <- function (m) {
  
  checkmate::assert_number(
    m,
    na.ok = FALSE,
    lower = 1,
    finite = TRUE,
    null.ok = FALSE
  )
  
  alpha <- rnorm(m, 1, 0.2)
  return(alpha)
  
}