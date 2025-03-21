# These unit tests were written by ChatGPT.

test_that("p_step_grm returns correct length and boundaries", {
  delta <- c(-2, 0, 1)
  theta <- 0
  alpha <- 1.0
  
  p <- p_step_grm(theta, alpha, delta)
  
  expect_type(p, "double")
  expect_length(p, length(delta) + 2)  # c(1, ..., ..., 0)
  expect_equal(p[1], 1)
  expect_equal(p[length(p)], 0)
})

test_that("p_step_grm returns probabilities in descending order", {
  delta <- c(-1, 0, 1, 2)
  p <- p_step_grm(theta = 0.5, alpha = 1, delta = delta)
  
  expect_true(all(diff(p) <= 0))  # decreasing
})

test_that("p_step_grm works with negative theta and steep slope", {
  delta <- c(-3, -2, -1)
  p <- p_step_grm(theta = -1.5, alpha = 2, delta = delta)
  
  expect_true(all(p >= 0 & p <= 1))
})

test_that("p_step_grm throws error for unsorted delta", {
  delta <- c(0, -1, 1)
  expect_error(p_step_grm(theta = 0, alpha = 1, delta = delta))
})

