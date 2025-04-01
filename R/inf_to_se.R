#' Convert IRT information to standard errors
#' 
#' @param inf Number, IRT information
#' 
#' @return Numeric, standard error
#' @export
#' @examples
#' inf_to_se(0.5)
#' 

inf_to_se <- function (
    inf
    ) {
  
  checkmate::assert_number(
    inf,
    lower = 0, 
    na.ok = FALSE,
    finite = TRUE,
    null.ok = FALSE
  )
  
  se <- 1 / sqrt(inf)
  
  checkmate::assert_number(
    se,
    lower = 0,
    
    # For inf = 0, se = Inf because 0-division yields Inf in R
    finite = FALSE,
    na.ok = FALSE,
    null.ok = FALSE
  )
  
  return(se)
  
}