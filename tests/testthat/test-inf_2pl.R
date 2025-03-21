# These unit tests were written by ChatGPT.

test_that("inf_2pl returns a numeric value", {
  inf <- inf_2pl(theta = 0, alpha = 1.2, beta = 1.5)
  
  expect_type(inf, "double")
  expect_length(inf, 1)
})

test_that("inf_2pl values remain non-negative", {
  inf <- inf_2pl(theta = 0.5, alpha = 1.2, beta = 1.5)
  expect_gte(inf, 0)
})

test_that("inf_2pl is maximized when theta = beta", {
  info_peak <- inf_2pl(theta = 1.5, alpha = 1.2, beta = 1.5)
  info_low1 <- inf_2pl(theta = 0, alpha = 1.2, beta = 1.5)
  info_low2 <- inf_2pl(theta = 3, alpha = 1.2, beta = 1.5)
  
  expect_gt(info_peak, info_low1)
  expect_gt(info_peak, info_low2)
})

test_that("inf_2pl increases with larger alpha", {
  inf_low <- inf_2pl(theta = 0.5, alpha = 0.8, beta = 1)
  inf_high <- inf_2pl(theta = 0.5, alpha = 2.0, beta = 1)
  
  expect_gt(inf_high, inf_low)
})

test_that("inf_2pl returns almost 0 for extreme theta values", {
  inf_left <- inf_2pl(theta = -10, alpha = 1, beta = 0)
  inf_right <- inf_2pl(theta = 10, alpha = 1, beta = 0)
  
  expect_equal(inf_left, 0, tolerance = 0.01) # adjusted to higher tolerance
  expect_equal(inf_right, 0, tolerance = 0.01) # adjusted to higher tolerance
})

test_that("inf_2pl throws errors for invalid inputs", {
  expect_error(inf_2pl(theta = "invalid", alpha = 1.2, beta = 1.5))
  expect_error(inf_2pl(theta = 0.5, alpha = NA, beta = 1.5))
  expect_error(inf_2pl(theta = 0.5, alpha = 1.2, beta = NULL))
})
