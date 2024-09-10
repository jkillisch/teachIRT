#' Plot an ICC using the Rasch model
#'
#' @param theta_range Numeric vector of length 2, range of x-/theta-axis
#' @inheritParams p_rasch
#'
#' @return A ggplot2 object
#' @export
#' @examples
#' icc_rasch(beta = -0.7)
#' icc_rasch(beta = 0:2)

icc_rasch <- function (theta_range = c(-5, 5), beta) {

  checkmate::assert_numeric(
    beta,
    finite = TRUE,
    any.missing = FALSE,
    all.missing = FALSE,
    min.len = 1,
    null.ok = FALSE
  )

  I <- length(beta)

  grid <- lapply(
    beta,
    FUN = function (beta_i) {
      teachIRT:::compute_over_grid(theta_range, p_rasch, list(beta = beta_i))
    }
    )
  for (i in 1:I) grid[[i]] <- cbind(grid[[i]], i = i)
  grid <- do.call(rbind, grid)
  grid$i <- factor(grid$i)

  if (I == 1) {
    plot <- ggplot2::ggplot(grid, ggplot2::aes(x = theta, y = p))
  } else {
    plot <- ggplot2::ggplot(
      grid,
      ggplot2::aes(x = theta, y = p, color = i, group = i)
      )
  }

  plot <- plot +
    ggplot2::scale_y_continuous(breaks = seq(0, 1, 0.2), limits = 0:1) +
    ggplot2::scale_x_continuous(breaks = seq(theta_range[1], theta_range[2])) +
    ggplot2::xlab(latex2exp::TeX("$\\theta$")) +
    ggplot2::ylab(latex2exp::TeX("$P(U = 1 | \\theta, \\beta)$"))

  if (I == 1) {

    plot <- plot +
      ggplot2::ggtitle(
      latex2exp::TeX(
        paste0("ICC of a Rasch Model with $\\beta$ = ", beta)
        )
      )

  } else {

    plot <- plot +
      ggplot2::ggtitle(
        latex2exp::TeX(
          paste0(
            "ICCs of a Rasch Model with ",
            paste0("$\\beta_", 1:I, "$ = ", beta, collapse = ", ")
            )
        )
      ) +
      ggplot2::guides(color = ggplot2::guide_legend("Item"))

  }

  plot <- plot +
    ggplot2::geom_line(linewidth = 1.5) +
    ggplot2::theme_bw()

  plot

  return(plot)

}
