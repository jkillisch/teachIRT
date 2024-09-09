#' Plot an ICC using the Thurstonian IRT model
#' 
#' @inheritParams p_tirt
#' @inheritParams icc_rasch
#' @param rotation Numeric, increase or decrease to rotate
#' 
#' @export
#' @return Plots a 3D surface plot of the TIRT's ICC
#' @examples
#' icc_tirt( 
#'   mu = c(0, -0.2), 
#'   lambda = c(0.7, 0.8), 
#'   psi2 = c(1, 1)
#'   )
#' 

icc_tirt <- function (theta_range = c(-5, 5), mu, lambda, psi2, rotation = -210) {
  
  checkmate::assert_numeric(
    theta_range,
    finite = TRUE,
    any.missing = FALSE,
    len = 2,
    sorted = TRUE
  )
  
  checkmate::assert_number(
    rotation,
    na.ok = FALSE,
    finite = TRUE,
    null.ok = FALSE
  )
  
  grid_1 <- grid_2 <- seq(theta_range[1], theta_range[2], 0.2)
  grid <- expand.grid(theta_1 = grid_1, theta_2 = grid_2)
  grid <- cbind(grid, p = NA)
  
  for (i in 1:nrow(grid)) {
    
    grid[i, "p"] <- p_tirt(
      theta = unlist(grid[i, c("theta_1", "theta_2")]),
      mu = mu,
      lambda = lambda,
      psi2 = psi2
    )
    
  }
  
  theta_1_vals <- unique(grid$theta_1)
  theta_2_vals <- unique(grid$theta_2)
  p_matrix <- matrix(
    grid$p, 
    nrow = length(theta_1_vals), 
    ncol = length(theta_2_vals)
    )
  persp(
    x = theta_1_vals, 
    y = theta_2_vals, 
    z = p_matrix, 
    xlab = "Theta 1", 
    ylab = "Theta 2", 
    zlab = "P",
    theta = rotation,  # Rotation angle for the plot
    phi = 25,    # Elevation angle
    expand = 0.5, # Scale the z-axis
    col = "lightblue",  # Color of the surface
    ticktype = "detailed"  # Display detailed axes
  )
  
}

