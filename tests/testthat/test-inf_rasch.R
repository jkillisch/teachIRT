# These unit tests were written by ChatGPT.

test_that("inf_rasch returns numeric value between 0 and 0.25", {
  inf <- inf_rasch(theta = 0, beta = 0)
  
  expect_type(inf, "double")
  expect_length(inf, 1)
  expect_gte(inf, 0)
  expect_lte(inf, 0.25)
})

test_that("inf_rasch is highest when theta equals beta", {
  info_peak <- inf_rasch(theta = 0, beta = 0)
  info_low1 <- inf_rasch(theta = -3, beta = 0)
  info_low2 <- inf_rasch(theta = 3, beta = 0)
  
  expect_equal(round(info_peak, 4), 0.25)
  expect_lt(info_low1, info_peak)
  expect_lt(info_low2, info_peak)
})

test_that("inf_rasch is symmetric around theta = beta", {
  i1 <- inf_rasch(theta = -1, beta = 0)
  i2 <- inf_rasch(theta = 1, beta = 0)
  
  expect_equal(i1, i2, tolerance = 1e-6)
})

test_that("inf_rasch throws no errors for extreme theta values", {
  expect_silent(inf_rasch(theta = -10, beta = 0))
  expect_silent(inf_rasch(theta = 10, beta = 0))
})
