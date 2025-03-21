
# These unit tests were written by ChatGPT

test_that("softmax returns a probability vector", {
  z <- c(1, 2, 3)
  p <- softmax(z)
  
  expect_equal(length(p), length(z))
  expect_true(all(p >= 0 & p <= 1))
  expect_equal(sum(p), 1, tolerance = 1e-6)
})

test_that("softmax handles a single input correctly", {
  z <- c(5)
  p <- softmax(z)
  
  expect_equal(p, 1)
})

test_that("softmax throws an error for non-numeric input", {
  expect_error(softmax("abc"))
  expect_error(softmax(TRUE))
  expect_error(softmax(list(1, 2, 3)))
})

test_that("softmax output matches manual calculation", {
  z <- c(0, 1)
  w <- exp(z)
  expected <- w / sum(w)
  
  p <- softmax(z)
  expect_equal(p, expected)
})

# This unit test was initially written by ChatGPT and adjusted to z <= 709
# upon noticing that there is actually a limit to the exp function

test_that("softmax handles large values", {
  
  # This is the highest set of natural numbers softmax can handle because exp 
  # returns Inf for z >= 710.
  z <- c(707, 708, 709)
  p <- softmax(z)
  
  expect_equal(length(p), 3)
  expect_equal(sum(p), 1, tolerance = 1e-6)
  expect_true(all(p >= 0 & p <= 1))
})
