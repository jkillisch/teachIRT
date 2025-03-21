softmax <- function (z) {

  checkmate::assert_numeric(
    z,
    
    # exp returns Inf beginning from 710
    upper = 709
    )

  w <- exp(z)
  p <- w / sum(w)

  return(p)

}
