compute_over_grid <- function (theta_range, fun, args) {

  grid <- data.frame(theta = seq(theta_range[1], theta_range[2], by = 0.2))
  grid$p <- NA

  for (g in 1:nrow(grid)) {
    grid$p[g] <- do.call(fun, c(list(theta = grid$theta[g]), args))
  }

  return(grid)

}
