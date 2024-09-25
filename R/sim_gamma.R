#' Sample m guessing parameters
#' 
#' \eqn{\boldsymbol{\gamma} \sim \text{beta}(1, 5)}
#' 
#' @inheritParams sim_beta
#' @return A vector of guessing parameters
sim_gamma <- function (m) {
  
  checkmate::assert_number(
    m,
    na.ok = FALSE,
    lower = 1,
    finite = TRUE,
    null.ok = FALSE
  )
  
  gamma <- rbeta(m, 1, 5)
  return(gamma)
  
}