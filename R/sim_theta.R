#' Sample n person parameters
#' 
#' \eqn{\boldsymbol{\theta} \sim N(0, 1)}
#' 
#' @param n Numeric, number of participants
#' @return A vector of person parameters
sim_theta <- function (n) {
  
  checkmate::assert_number(
    n,
    na.ok = FALSE,
    lower = 1,
    finite = TRUE,
    null.ok = FALSE
  )
  
  theta <- rnorm(n, 0, 1)
  return(theta)
  
}