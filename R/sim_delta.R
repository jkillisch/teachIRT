#' Sample m_star threshold parameters
#' 
#' Can be used for PCM, GPCM, and GRM
#' 
#' A vector of threshold differences is drawn. The distribution depends on the
#' number of categories to ensure an equal spacing of thresholds along the
#' standard normal metric of the person parameters. The threshold differences
#' are then centered around a mean item position that is sampled using
#' \eqn{\mu \sim N(0, .1)}.
#' 
#' @param m_star Number of categories - 1
#' @return A vector of sorted threshold parameters
sim_delta <- function (m_star) {
  
  checkmate::assert_number(
    m_star,
    na.ok = FALSE,
    lower = 2,
    finite = TRUE,
    null.ok = FALSE
  )
  
  # Sample stepwise differences
  dif <- rep(NA, m_star)
  dif[1] <- 0
  
  for (k in 2:(m_star)) {
    
    # Force wide thresholds in the metric of a standard normal distribution
    v <- (6/m_star)
    dif[k] <- dif[k-1] + v + runif(1, -(v/10), v/10)
  }
  
  # Sample mean threshold
  mean <- rnorm(1, 0, 0.1)
  
  # Center
  delta <- dif - mean(dif) + mean
  
  return(delta)
  
}
