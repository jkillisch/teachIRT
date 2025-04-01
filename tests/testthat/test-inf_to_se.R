test_that("inf_to_se returns specific known values", {
  
  expect_equal(inf_to_se(0), Inf)
  expect_equal(inf_to_se(1), 1)
  expect_equal(inf_to_se(100), 0.1)
  
})

test_that("inf_to_se throws errors for unexpected input", {
  
  expect_error(inf_to_se(-1))
  expect_error(inf_to_se("a"))
  expect_error(inf_to_se(TRUE))
  expect_error(inf_to_se(1:3))
  expect_error(inf_to_se(NULL))
  expect_error(inf_to_se(NA))
  
})

test_that("inf_to_se returns a number", {
  
  sapply(1:10, function (x) {expect_true(is.numeric(inf_to_se(x)))})
  
})
