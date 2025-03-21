# These unit tests were written by ChatGPT.

test_that("compute_over_grid returns a data frame with correct structure", {
  grid <- compute_over_grid(
    theta_range = c(-1, 1),
    fun = p_2pl,
    args = list(alpha = 1, beta = 0)
  )
  
  expect_s3_class(grid, "data.frame")
  expect_true(all(c("theta", "p") %in% names(grid)))
  expect_type(grid$theta, "double")
  expect_type(grid$p, "double")
})

test_that("compute_over_grid evaluates function over grid correctly", {
  grid <- compute_over_grid(
    theta_range = c(0, 0.4),
    fun = p_2pl,
    args = list(alpha = 1, beta = 0)
  )
  
  expect_equal(grid$theta, c(0.0, 0.2, 0.4), tolerance = 1e-6)
  expect_true(all(grid$p >= 0 & grid$p <= 1))
  expect_gt(grid$p[3], grid$p[1])  # probability increases with theta
})

test_that("compute_over_grid handles theta_range with a single point", {
  grid <- compute_over_grid(
    theta_range = c(0, 0),
    fun = p_2pl,
    args = list(alpha = 1, beta = 0)
  )
  
  expect_equal(nrow(grid), 1)
  expect_equal(grid$theta, 0)
  expect_equal(grid$p, 0.5, tolerance = 1e-6)
})

test_that("compute_over_grid throws error for invalid function or args", {
  expect_error(compute_over_grid(c(-1, 1), fun = "not_a_function", args = list()))
  expect_error(compute_over_grid(c(-1, 1), fun = p_2pl, args = list(alpha = "bad", beta = 0)))
})
