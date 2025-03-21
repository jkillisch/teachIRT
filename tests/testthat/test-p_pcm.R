# These unit tests were written by ChatGPT.

test_that("p_pcm returns a numeric probability vector of correct length", {
  delta <- c(-1, 0, 1)
  theta <- 0.5
  p <- p_pcm(theta, delta)
  
  expect_type(p, "double")
  expect_length(p, length(delta) + 1)  # categories = length(delta) + 1
  expect_true(all(p >= 0 & p <= 1))
  expect_equal(sum(p), 1, tolerance = 1e-6)
})

test_that("p_pcm works with symmetric thresholds", {
  delta <- c(-1, 0, 1)
  p <- p_pcm(theta = 0, delta = delta)
  
  expect_true(all(p >= 0 & p <= 1))
  expect_equal(sum(p), 1, tolerance = 1e-6)
})

test_that("p_pcm gives uniform probabilities when thresholds are zero and theta = 0", {
  delta <- c(0, 0, 0)
  p <- p_pcm(theta = 0, delta = delta)
  
  expect_equal(p, rep(1/4, 4), tolerance = 1e-6)
})

test_that("p_pcm is skewed towards higher categories for high theta", {
  delta <- c(-1, 0, 1)
  p <- p_pcm(theta = 3, delta = delta)
  
  mode_index <- which.max(p)
  expect_gte(mode_index, 3)  # most probable in higher categories
})

test_that("p_pcm throws error for non-numeric delta", {
  expect_error(p_pcm(theta = 0, delta = "not numeric"))
  expect_error(p_pcm(theta = 0, delta = NA))
  expect_error(p_pcm(theta = 0, delta = NULL))
})
