#' Sample responses from a Partial Credit Model
#' 
#' @inheritParams sim_theta
#' @inheritParams sim_beta
#' @inheritParams sim_delta
#' 
#' @return A data.frame of simulated responses with \eqn{n} rows and \eqn{m} 
#' colums
#' @export
sim_pcm <- function (n, m, m_star) {
  
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
  
  checkmate::assert_number(
    m_star,
    na.ok = FALSE,
    lower = 2,
    finite = TRUE,
    null.ok = FALSE
  )
  
  theta <- sim_theta(n)
  delta <- replicate(m, sim_delta(m_star), FALSE)
  delta <- do.call(rbind, delta)
  
  U <- matrix(NA, n, m)
  rownames(U) <- paste0("person", 1:n)
  colnames(U) <- paste0("item_", 1:m)
  
  for (i in 1:n) {
    
    for (j in 1:m) {
      
      p_ij <- p_pcm(theta[i], delta[j,])
      U[i, j] <- sample(0:m_star, 1, prob = p_ij)
      
    }
    
  }
  
  U <- as.data.frame(U)
  
  return(U)
  
}