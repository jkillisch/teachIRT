# These unit tests were written by ChatGPT.

test_that("p_gpcm returns a valid probability vector of correct length", {
  delta <- c(-3, -1, 2)
  theta <- 0
  alpha <- 2
  
  p <- p_gpcm(theta, alpha, delta)
  
  expect_type(p, "double")
  expect_length(p, length(delta) + 1)
  expect_true(all(p >= 0 & p <= 1))
  expect_equal(sum(p), 1, tolerance = 1e-6)
})

test_that("p_gpcm produces probabilities that shift with increasing theta", {
  delta <- c(-2, 0, 2)
  alpha <- 1
  
  p_low <- p_gpcm(theta = -2, alpha = alpha, delta = delta)
  p_high <- p_gpcm(theta = 2, alpha = alpha, delta = delta)
  
  expect_lt(which.max(p_low), which.max(p_high))
})

test_that("p_gpcm returns uniform distribution when deltas and alpha are zero", {
  delta <- c(0, 0, 0)
  alpha <- 0
  theta <- 0
  
  p <- p_gpcm(theta, alpha, delta)
  expect_equal(p, rep(1/4, 4), tolerance = 1e-6)
})

test_that("p_gpcm throws error for non-numeric delta", {
  expect_error(p_gpcm(theta = 0, alpha = 1, delta = "a"))
  expect_error(p_gpcm(theta = 0, alpha = 1, delta = NA))
  expect_error(p_gpcm(theta = 0, alpha = 1, delta = NULL))
})
