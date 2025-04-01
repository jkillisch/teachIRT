#' Get z-values for a given alpha-level and test direction
#' 
#' ci_alpha is the alpha-level and should not be confused with the 
#' discrimination parameter used in other functions.
#' 
#' @param ci_alpha Number between 0 and 1, alpha-level
#' @param ci_direction Character, either "lower", "upper", or "both"
#' 
#' @return Two-elements numeric vector, lower and upper z-value
#' 
#' @export
#' @examples
#' get_z(ci_alpha = 0.05, ci_direction = "both")
#' 

get_z <- function (ci_alpha, ci_direction) {
  
  checkmate::assert_number(
    ci_alpha,
    na.ok = FALSE,
    lower = 0,
    upper = 1,
    finite = TRUE,
    null.ok = FALSE
  )
  
  checkmate::assert_string(
    ci_direction,
    na.ok = FALSE,
    pattern = "lower|upper|both",
    ignore.case = FALSE,
    null.ok = TRUE
  )
  
  z <- c(lower = NA, upper = NA)
  
  if (ci_direction == "both") {
    
    ci_alpha <- ci_alpha*0.5
    z["lower"] <- qnorm(ci_alpha)
    z["upper"] <- qnorm(1 - ci_alpha) 
    
  } else if (ci_direction == "lower") {
    
    z["lower"] <- qnorm(ci_alpha)
    z["upper"] <- Inf
    
  } else if (ci_direction == "upper") {
    
    z["lower"] <- -Inf
    z["upper"] <- qnorm(1 - ci_alpha)
    
  }
  
  checkmate::assert_numeric(
    z,
    lower = -Inf,
    upper = Inf,
    finite = FALSE,
    any.missing = FALSE,
    len = 2,
    sorted = TRUE
  )
  
  return(z)
  
}