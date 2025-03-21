# These unit tests were written by ChatGPT.

test_that("icc_3pl returns a ggplot object for single item", {
  plot <- icc_3pl(alpha = 1, beta = 0.5, gamma = 0.2)
  expect_s3_class(plot, "ggplot")
})

test_that("icc_3pl returns a ggplot object for multiple items", {
  plot <- icc_3pl(
    alpha = c(1, 1.5),
    beta = c(0, 1),
    gamma = c(0.2, 0.25)
  )
  expect_s3_class(plot, "ggplot")
})

test_that("icc_3pl produces probabilities in [0, 1]", {
  plot <- icc_3pl(alpha = 1.2, beta = 0.5, gamma = 0.25)
  data <- plot$data
  expect_true(all(data$p >= 0 & data$p <= 1))
})

test_that("icc_3pl works with custom theta_range", {
  plot <- icc_3pl(
    theta_range = c(-3, 3),
    alpha = 1,
    beta = 0,
    gamma = 0.2
  )
  data <- plot$data
  expect_gte(min(data$theta), -3)
  expect_lte(max(data$theta), 3)
})

test_that("icc_3pl throws error if alpha, beta, gamma lengths differ", {
  expect_error(icc_3pl(alpha = c(1, 1), beta = 0.5, gamma = 0.2))
  expect_error(icc_3pl(alpha = 1, beta = c(0, 1), gamma = 0.2))
  expect_error(icc_3pl(alpha = 1, beta = 0.5, gamma = c(0.1, 0.2)))
})

test_that("icc_3pl throws error for invalid gamma values", {
  expect_error(icc_3pl(alpha = 1, beta = 0.5, gamma = -0.1))
  expect_error(icc_3pl(alpha = 1, beta = 0.5, gamma = 1.1))
  expect_error(icc_3pl(alpha = 1, beta = 0.5, gamma = NA))
})
