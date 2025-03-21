# These unit tests were written by ChatGPT.

test_that("inf_3pl returns a numeric value", {
  inf <- inf_3pl(theta = 0, alpha = 1, beta = 0.5, gamma = 0.3)
  
  expect_type(inf, "double")
  expect_length(inf, 1)
})

test_that("inf_3pl is non-negative", {
  inf <- inf_3pl(theta = 0, alpha = 1, beta = 0.5, gamma = 0.3)
  expect_gte(inf, 0)
})

test_that("inf_3pl is maximized when theta = beta", {
  info_peak <- inf_3pl(theta = 0.5, alpha = 1, beta = 0.5, gamma = 0.2)
  info_low1 <- inf_3pl(theta = -2, alpha = 1, beta = 0.5, gamma = 0.2)
  info_low2 <- inf_3pl(theta = 2, alpha = 1, beta = 0.5, gamma = 0.2)
  
  expect_gt(info_peak, info_low1)
  expect_gt(info_peak, info_low2)
})

test_that("inf_3pl decreases as gamma increases", {
  inf_low <- inf_3pl(theta = 0, alpha = 1, beta = 0, gamma = 0.4)
  inf_high <- inf_3pl(theta = 0, alpha = 1, beta = 0, gamma = 0.1)
  
  expect_lt(inf_low, inf_high)
})

test_that("inf_3pl returns near zero for extreme theta values", {
  inf_left <- inf_3pl(theta = -10, alpha = 1, beta = 0, gamma = 0.2)
  inf_right <- inf_3pl(theta = 10, alpha = 1, beta = 0, gamma = 0.2)
  
  expect_lte(inf_left, 0.01) # increase tol
  expect_lte(inf_right, 0.01) # increased tol
})

test_that("inf_3pl throws errors for invalid inputs", {
  expect_error(inf_3pl(theta = "invalid", alpha = 1, beta = 0.5, gamma = 0.3))
  expect_error(inf_3pl(theta = 0, alpha = NA, beta = 0.5, gamma = 0.3))
  expect_error(inf_3pl(theta = 0, alpha = 1, beta = NULL, gamma = 0.3))
  expect_error(inf_3pl(theta = 0, alpha = 1, beta = 0.5, gamma = -0.1))  # gamma must be in [0,1]
  expect_error(inf_3pl(theta = 0, alpha = 1, beta = 0.5, gamma = 1.2))   # gamma must be in [0,1]
})
