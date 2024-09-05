#' Plot OCCs using the GRM
#'
#' @inheritParams icc_rasch
#' @inheritParams p_grm
#'
#' @return A ggplot2 object
#' @export
#' @examples
#' occ_grm(alpha = 1.2, delta = c(-2, -0.5, 1.5))

occ_grm <- function (theta_range = c(-5, 5), alpha, delta) {

  m <- length(delta)

  grid <- data.frame(theta = seq(theta_range[1], theta_range[2], by = 0.2))
  p_mat <- matrix(NA, nrow = nrow(grid), ncol = m+2)
  colnames(p_mat) <- paste0("p_", 0:(m+1))
  for (g in 1:nrow(grid)) {
    p_mat[g, ] <- p_step_grm(theta = grid$theta[g], alpha = alpha, delta = delta)
  }
  p_mat <- p_mat[, -1]
  p_mat <- p_mat[, -ncol(p_mat)]
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
    ggplot2::ylab(latex2exp::TeX("$P(U = c | \\theta, \\alpha, \\delta_1, ..., \\delta_m)$")) +
    ggplot2::ggtitle(
      latex2exp::TeX(
        paste0(
          "OCCs of a GRM with ",
          delta_tex,
          " and $\\alpha$ = ",
          alpha
        )
      )
    ) +
    ggplot2::geom_line(linewidth = 1.5) +
    ggplot2::theme_bw()

  plot

  return(plot)

}
