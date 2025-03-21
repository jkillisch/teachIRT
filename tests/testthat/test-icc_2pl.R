# These unit tests were written by ChatGPT.

test_that("icc_2pl returns a ggplot object for a single item", {
  plot <- icc_2pl(alpha = 1.2, beta = 0.5)
  expect_s3_class(plot, "ggplot")
})

test_that("icc_2pl returns a ggplot object for multiple items", {
  plot <- icc_2pl(alpha = c(1, 1.5), beta = c(0, 1))
  expect_s3_class(plot, "ggplot")
})

test_that("icc_2pl returns valid probability range", {
  plot <- icc_2pl(alpha = 1.5, beta = 0)
  data <- plot$data
  
  expect_true(all(data$p >= 0 & data$p <= 1))
})

test_that("icc_2pl respects custom theta_range", {
  plot <- icc_2pl(theta_range = c(-3, 3), alpha = 1, beta = 0)
  data <- plot$data
  
  expect_gte(min(data$theta), -3)
  expect_lte(max(data$theta), 3)
})

test_that("icc_2pl throws error when alpha and beta lengths differ", {
  expect_error(icc_2pl(alpha = 1, beta = c(0, 1)))
  expect_error(icc_2pl(alpha = c(1, 1.2), beta = 0))
})

test_that("icc_2pl throws error for non-numeric inputs", {
  expect_error(icc_2pl(alpha = "a", beta = 0))
  expect_error(icc_2pl(alpha = 1, beta = NA))
  expect_error(icc_2pl(alpha = NULL, beta = 0))
})
