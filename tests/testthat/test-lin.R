# These unit tests were written by ChatGPT.

test_that("lin returns correct linear predictor", {
  expect_equal(lin(theta = 1, alpha = 2, beta = 0.5), 1.0)
  expect_equal(lin(theta = 0, alpha = 1, beta = 0), 0)
  expect_equal(lin(theta = -1, alpha = 1.5, beta = 1), -3)
})

test_that("lin handles zero alpha correctly", {
  expect_equal(lin(theta = 10, alpha = 0, beta = 5), 0)
})

test_that("lin returns negative when theta < beta and alpha > 0", {
  expect_lt(lin(theta = 0, alpha = 1, beta = 1), 0)
})

test_that("lin throws error for non-numeric inputs", {
  expect_error(lin(theta = "a", alpha = 1, beta = 1))
  expect_error(lin(theta = 1, alpha = NA, beta = 1))
  expect_error(lin(theta = 1, alpha = 1, beta = NULL))
  expect_error(lin(theta = 1, alpha = 1, beta = "b"))
})
