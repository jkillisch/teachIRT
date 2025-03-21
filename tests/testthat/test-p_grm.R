# These unit tests were written by ChatGPT.

test_that("p_grm returns a valid probability vector with correct length", {
  delta <- c(-2, 0, 1.5)
  alpha <- 1.2
  theta <- 1
  
  p <- p_grm(theta, alpha, delta)
  
  expect_type(p, "double")
  expect_length(p, length(delta) + 1)  # m + 1 categories
  expect_true(all(p >= 0 & p <= 1))
  expect_equal(sum(p), 1, tolerance = 1e-6)
})

test_that("p_grm shifts distribution with higher theta", {
  delta <- c(-1, 0, 1)
  alpha <- 1
  
  p_low <- p_grm(theta = -2, alpha = alpha, delta = delta)
  p_high <- p_grm(theta = 2, alpha = alpha, delta = delta)
  
  expect_gt(which.max(p_high), which.max(p_low))
})

test_that("p_grm throws error for unsorted delta", {
  delta_unsorted <- c(1, -1, 0)
  expect_error(p_grm(theta = 0, alpha = 1, delta = delta_unsorted))
})
