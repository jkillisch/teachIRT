#' Plot information function using the Rasch model
#'
#' @inheritParams icc_rasch
#' @inheritParams p_rasch
#'
#' @return A ggplot2 object
#' @export
#' @examples
#' inf_plot_rasch(beta = 0.5)

inf_plot_rasch <- function (theta_range = c(-5, 5), beta) {

  grid <- compute_over_grid(theta_range, inf_rasch, args = list(beta = beta))

  plot <- ggplot2::ggplot(grid, ggplot2::aes(x = theta, y = p)) +
    ggplot2::geom_line(linewidth = 1.5) +
    ggplot2::scale_y_continuous(limits = c(0, 0.25)) +
    ggplot2::scale_x_continuous(breaks = seq(theta_range[1], theta_range[2])) +
    ggplot2::xlab(latex2exp::TeX("$\\theta$")) +
    ggplot2::ylab(latex2exp::TeX("$I(\\theta)$")) +
    ggplot2::ggtitle(
      latex2exp::TeX(paste0("Information Function of a Rasch-Model with $\\beta$ = ", beta))
    ) +
    ggplot2::theme_bw()

  plot

  return(plot)

}
