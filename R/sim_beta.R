#' Sample m item difficulty parameters
#' 
#' \eqn{\boldsymbol{\beta} \sim N(0, 1)}
#' 
#' @param m Numeric, number of items
#' @return A vector of item difficulty parameters
sim_beta <- function (m) {
  
  checkmate::assert_number(
    m,
    na.ok = FALSE,
    lower = 1,
    finite = TRUE,
    null.ok = FALSE
  )
  
  beta <- rnorm(m, 0, 1)
  return(beta)
  
}