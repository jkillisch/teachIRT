softmax <- function (z) {

  checkmate::assert_numeric(z)

  w <- exp(z)
  p <- w / sum(w)

  return(p)

}
