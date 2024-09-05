#' Plot ICCs using the GPCM
#'
#' @inheritParams icc_rasch
#' @inheritParams p_gpcm
#'
#' @return A ggplot2 object
#' @export
#' @examples
#' icc_gpcm(alpha = 2, delta = c(-3, -1, 2))

icc_gpcm <- function (theta_range = c(-5, 5), alpha, delta) {

  m <- length(delta)

  grid <- data.frame(theta = seq(theta_range[1], theta_range[2], by = 0.2))
  p_mat <- matrix(NA, nrow = nrow(grid), ncol = m+1)
  colnames(p_mat) <- paste0("p_", 0:(m))
  for (g in 1:nrow(grid)) {
    p_mat[g, ] <- p_gpcm(theta = grid$theta[g], alpha = alpha, delta = delta)
  }
  grid <- cbind(grid, p_mat)

  grid <- tidyr::pivot_longer(
    grid,
    dplyr::all_of(colnames(p_mat)),
    values_to = "p",
    names_to = "cat",
    names_prefix = "p_",
    names_transform = as.numeric
  )

  delta_tex <- paste0("$\\delta_", 1:m)
  delta_tex <- paste(delta_tex, " = ", delta, "$")
  delta_tex <- paste0(delta_tex, collapse = ", ")

  grid <- dplyr::mutate(grid, cat = as.character(cat))

  plot <- ggplot2::ggplot(grid, ggplot2::aes(x = theta, y = p, group = cat, color = cat)) +
    ggplot2::scale_y_continuous(breaks = seq(0, 1, 0.2), limits = 0:1) +
    ggplot2::scale_x_continuous(breaks = seq(theta_range[1], theta_range[2])) +
    ggplot2::xlab(latex2exp::TeX("$\\theta$")) +
    ggplot2::ylab(latex2exp::TeX("$P(U = c | \\theta, \\delta_1, ..., \\delta_m)$")) +
    ggplot2::ggtitle(
      latex2exp::TeX(
        paste0(
          "ICCs of a GPCM with ",
          delta_tex,
          " and $\\alpha$ = ",
          alpha
        )
      )
    ) +
    ggplot2::geom_line(linewidth = 1.5) +
    ggplot2::theme_bw()

  return(plot)

}
