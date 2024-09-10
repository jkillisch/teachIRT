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

  checkmate::assert_numeric(
    beta,
    finite = TRUE,
    any.missing = FALSE,
    all.missing = FALSE,
    min.len = 1,
    null.ok = FALSE
  )

  checkmate::assert_numeric(
    alpha,
    finite = TRUE,
    any.missing = FALSE,
    all.missing = FALSE,
    min.len = 1,
    null.ok = FALSE
  )

  checkmate::assert_numeric(
    gamma,
    lower = 0,
    upper = 1,
    finite = TRUE,
    any.missing = FALSE,
    all.missing = FALSE,
    min.len = 1,
    null.ok = FALSE
  )

  I <- length(beta)
  stopifnot(
    "Length alpha, beta, and gamma must be identical." =
      I == length(alpha) & length(alpha) == length(gamma)
  )

  grid <- mapply(
    alpha_i = alpha, beta_i = beta, gamma_i = gamma,
    FUN = function (alpha_i, beta_i, gamma_i) {
      teachIRT:::compute_over_grid(
        theta_range,
        p_3pl,
        list(alpha = alpha_i, beta = beta_i, gamma = gamma_i)
        )
    },
    SIMPLIFY = FALSE
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
    ggplot2::ylab(latex2exp::TeX("$P(U = 1 | \\theta, \\alpha, \\beta, \\gamma)$"))

  if (I == 1) {

    plot <- plot +
      ggplot2::ggtitle(
        latex2exp::TeX(
          paste0(
            "ICC of a 3PL Model with $\\alpha$ = ",
            alpha,
            " and $\\beta$ = ",
            beta,
            " and $\\gamma$ = ",
            gamma
            )
        )
      )

  } else {

    plot <- plot +
      ggplot2::ggtitle(
        latex2exp::TeX(
          paste0(
            "ICCs of a 3PL Model with ",
            paste0("$\\alpha_", 1:I, "$ = ", alpha, collapse = ", "),
            " and ",
            paste0("$\\beta_", 1:I, "$ = ", beta, collapse = ", "),
            " and ",
            paste0("$\\gamma_", 1:I, "$ = ", gamma, collapse = ", ")
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
