#' Compute confidence intervals around person parameters
#' 
#' This function is called by the specialized ci-functions.
#' 
#' @inheritParams p_rasch
#' @inheritParams inf_to_se
#' @inheritParams get_z
#' 
#' @return Numeric, two-element vector of confidence interval limits
#' 

ci_general <- function (theta, inf, ci_alpha, ci_direction) {
  
  checkmate::assert_number(
    theta,
    na.ok = FALSE,
    finite = TRUE,
    null.ok = FALSE
  )
  
  checkmate::assert_number(
    inf,
    lower = 0, 
    na.ok = FALSE,
    finite = TRUE,
    null.ok = FALSE
  )
  
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
  
  se <- inf_to_se(inf)
  z <- get_z(ci_alpha, ci_direction)
  
  ci <- c(lower = NA, upper = NA)
  ci["lower"] <- theta + z["lower"]*se
  ci["upper"] <- theta + z["upper"]*se
  
  checkmate::assert_numeric(
    ci,
    lower = -Inf,
    upper = Inf,
    finite = FALSE,
    any.missing = FALSE,
    len = 2,
    sorted = TRUE
  )
  
  return(ci)
  
}