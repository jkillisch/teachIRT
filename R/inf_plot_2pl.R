#' Plot information function using the 2PL model
#'
#' @inheritParams icc_2pl
#' @inheritParams p_2pl
#' @param y_lim Numeric, upper limit of the y-/information-axis
#'
#' @return A ggplot2 object
#' @export
#' @examples
#' inf_plot_2pl(alpha = 1.2, beta = 1.5)

inf_plot_2pl <- function (theta_range = c(-5, 5), alpha, beta, y_lim = NULL) {

  checkmate::assert_number(y_lim, null.ok = TRUE, lower = 0, finite = TRUE)

  grid <- compute_over_grid(
    theta_range,
    inf_2pl,
    args = list(alpha = alpha, beta = beta)
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
          "Information Function of a 2PL-Model with $\\beta$ = ", beta,
          ", $\\alpha$ = ", alpha
          )
        )
    ) +
    ggplot2::theme_bw()

  plot

  return(plot)

}
