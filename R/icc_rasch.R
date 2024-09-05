#' Plot an ICC using the Rasch model
#'
#' @param theta_range Numeric vector of length 2, range of x-/theta-axis
#' @inheritParams p_rasch
#'
#' @return A ggplot2 object
#' @export
#' @examples
#' icc_rasch(beta = -0.7)

icc_rasch <- function (theta_range = c(-5, 5), beta) {

  grid <- compute_over_grid(theta_range, p_rasch, list(beta = beta))

  plot <- ggplot2::ggplot(grid, ggplot2::aes(x = theta, y = p)) +
    ggplot2::scale_y_continuous(breaks = seq(0, 1, 0.2), limits = 0:1) +
    ggplot2::scale_x_continuous(breaks = seq(theta_range[1], theta_range[2])) +
    ggplot2::xlab(latex2exp::TeX("$\\theta$")) +
    ggplot2::ylab(latex2exp::TeX("$P(U = 1 | \\theta, \\beta)$")) +
    ggplot2::ggtitle(
      latex2exp::TeX(paste0("ICC of a Rasch Model with $\\beta$ = ", beta))
      ) +
    ggplot2::geom_line(linewidth = 1.5) +
    ggplot2::theme_bw()

  plot

  return(plot)

}
