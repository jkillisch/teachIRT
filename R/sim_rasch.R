#' Sample responses from a Rasch model
#' 
#' @inheritParams sim_theta
#' @inheritParams sim_beta
#' 
#' @return A data.frame of simulated responses with \eqn{n} rows and \eqn{m} 
#' colums
#' @export
sim_rasch <- function (n, m) {
  
  checkmate::assert_number(
    n,
    na.ok = FALSE,
    lower = 1,
    finite = TRUE,
    null.ok = FALSE
  )
  
  checkmate::assert_number(
    m,
    na.ok = FALSE,
    lower = 1,
    finite = TRUE,
    null.ok = FALSE
  )
  
  theta <- sim_theta(n)
  beta <- sim_beta(m)
  
  U <- matrix(NA, n, m)
  rownames(U) <- paste0("person", 1:n)
  colnames(U) <- paste0("item_", 1:m)
  
  for (i in 1:n) {
    
    for (j in 1:m) {
      
      p_ij <- p_rasch(theta[i], beta[j])
      U[i, j] <- sample(c(0, 1), 1, prob = c(1-p_ij, p_ij))
      
    }
    
  }
  
  U <- as.data.frame(U)
  
  return(U)
  
}