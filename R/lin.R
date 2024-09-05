lin <- function (theta, alpha, beta) {

  checkmate::assert_number(theta)
  checkmate::assert_number(alpha)
  checkmate::assert_number(beta)

  lin <- alpha*(theta-beta)

  return(lin)

  checkmate::assert_number(lin)

  }
