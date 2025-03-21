# These unit tests were written by ChatGPT.

test_that("p_rasch returns a probability between 0 and 1", {
  p <- p_rasch(theta = 0, beta = 0)
  expect_type(p, "double")
  expect_length(p, 1)
  expect_gte(p, 0)
  expect_lte(p, 1)
})

test_that("p_rasch gives expected output for known values", {
  expect_equal(p_rasch(theta = 0, beta = 0), 0.5, tolerance = 1e-6)
  expect_gt(p_rasch(theta = 2, beta = 0), 0.5)
  expect_lt(p_rasch(theta = -2, beta = 0), 0.5)
})

test_that("p_rasch increases with higher theta", {
  p1 <- p_rasch(theta = -1, beta = 0)
  p2 <- p_rasch(theta = 0, beta = 0)
  p3 <- p_rasch(theta = 1, beta = 0)
  
  expect_lt(p1, p2)
  expect_lt(p2, p3)
})

test_that("p_rasch decreases with higher beta", {
  p1 <- p_rasch(theta = 0, beta = -1)
  p2 <- p_rasch(theta = 0, beta = 0)
  p3 <- p_rasch(theta = 0, beta = 1)
  
  expect_gt(p1, p2)
  expect_gt(p2, p3)
})

