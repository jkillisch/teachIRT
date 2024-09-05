#' Plot information function using the 3PL model
#'
#' @inheritParams icc_3pl
#' @inheritParams p_3pl
#' @inheritParams p_2pl
#'
#' @return A ggplot2 object
#' @export
#' @examples
#' inf_plot_3pl(alpha = 1, beta = 0.5, gamma = 0.3)

inf_plot_3pl <- function (theta_range = c(-5, 5), alpha, beta, gamma, y_lim = NULL) {

  checkmate::assert_number(y_lim, null.ok = TRUE, lower = 0, finite = TRUE)

  grid <- compute_over_grid(
    theta_range,
    inf_3pl,
    args = list(alpha = alpha, beta = beta, gamma = gamma)
  )

  plot <-
    ggplot2::ggplot(grid, ggplot2::aes(x = theta, y = p)) +
    ggplot2::geom_line(linewidth = 1.5) +
    ggplot2::scale_x_continuous(breaks = seq(theta_range[1], theta_range[2]))

  if (!is.null(y_lim)) {
    plot <- plot + ggplot2::scale_y_continuous(limits = c(0, y_lim))
  }
  plot <-
    plot +
    ggplot2::xlab(latex2exp::TeX("$\\theta$")) +
    ggplot2::ylab(latex2exp::TeX("$I(\\theta)$")) +
    ggplot2::ggtitle(
      latex2exp::TeX(
        paste0(
          "Information Function of a 3PL-Model with $\\beta$ = ", beta,
          ", $\\alpha$ = ", alpha, ", $\\gamma$ = ", gamma
        )
      )
    ) +
    ggplot2::theme_bw()

  plot

  return(plot)

}
