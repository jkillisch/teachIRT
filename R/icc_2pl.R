#' Plot an ICC using the 2PL model
#'
#' @inheritParams icc_rasch
#' @inheritParams p_2pl
#'
#' @return A ggplot2 object
#' @export
#' @examples
#' icc_2pl(alpha = 1.2, beta = 1.5)

icc_2pl <- function (theta_range = c(-5, 5), alpha, beta) {

  grid <- compute_over_grid(
    theta_range,
    p_2pl,
    list(alpha = alpha, beta = beta)
    )

  plot <- ggplot2::ggplot(grid, ggplot2::aes(x = theta, y = p)) +
    ggplot2::scale_y_continuous(breaks = seq(0, 1, 0.2), limits = 0:1) +
    ggplot2::scale_x_continuous(breaks = seq(theta_range[1], theta_range[2])) +
    ggplot2::xlab(latex2exp::TeX("$\\theta$")) +
    ggplot2::ylab(latex2exp::TeX("$P(U = 1 | \\theta, \\alpha, \\beta)$")) +
    ggplot2::ggtitle(
      latex2exp::TeX(
        paste0(
          "ICC of a 2PL Model with $\\alpha$ = ",
          alpha,
          " and $\\beta$ = ",
          beta
          )
        )
    ) +
    ggplot2::geom_line(linewidth = 1.5) +
    ggplot2::theme_bw()

  return(plot)

}
