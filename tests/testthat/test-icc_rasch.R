# These unit tests were written by ChatGPT.

test_that("icc_rasch returns a ggplot object for a single item", {
  plot <- icc_rasch(beta = -0.7)
  expect_s3_class(plot, "ggplot")
})

test_that("icc_rasch returns a ggplot object for multiple items", {
  plot <- icc_rasch(beta = c(0, 1, 2))
  expect_s3_class(plot, "ggplot")
})

test_that("icc_rasch returns valid probability range", {
  plot <- icc_rasch(beta = 0)
  data <- plot$data
  
  expect_true(all(data$p >= 0 & data$p <= 1))
})

test_that("icc_rasch respects custom theta_range", {
  plot <- icc_rasch(theta_range = c(-3, 3), beta = 0)
  data <- plot$data
  
  expect_gte(min(data$theta), -3)
  expect_lte(max(data$theta), 3)
})

test_that("icc_rasch throws error for non-numeric beta", {
  expect_error(icc_rasch(beta = "a"))
  expect_error(icc_rasch(beta = NA))
  expect_error(icc_rasch(beta = NULL))
})
