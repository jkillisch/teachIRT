#' Plot an ICC using the 3PL model
#'
#' @inheritParams icc_rasch
#' @inheritParams p_3pl
#'
#' @return A ggplot2 object
#' @export
#' @examples
#' icc_3pl(alpha = 1, beta = 0.5, gamma = 0.3)

icc_3pl <- function (theta_range = c(-5, 5), alpha, beta, gamma) {

  grid <- compute_over_grid(
    theta_range,
    p_3pl,
    list(alpha = alpha, beta = beta, gamma = gamma)
  )

  plot <- ggplot2::ggplot(grid, ggplot2::aes(x = theta, y = p)) +
    ggplot2::scale_y_continuous(breaks = seq(0, 1, 0.2), limits = 0:1) +
    ggplot2::scale_x_continuous(breaks = seq(theta_range[1], theta_range[2])) +
    ggplot2::xlab(latex2exp::TeX("$\\theta$")) +
    ggplot2::ylab(latex2exp::TeX("$P(U = 1 | \\theta, \\alpha, \\beta, \\gamma)$")) +
    ggplot2::ggtitle(
      latex2exp::TeX(
        paste0(
          "ICC of a 3PL Model with $\\alpha$ = ",
          alpha,
          ", $\\beta$ = ",
          beta,
          " and $\\gamma$ = ",
          gamma
        )
      )
    ) +
    ggplot2::geom_line(linewidth = 1.5) +
    ggplot2::theme_bw()

  return(plot)

}
