# These unit tests were written by ChatGPT.

test_that("inf_plot_3pl returns a ggplot object", {
  plot <- inf_plot_3pl(alpha = 1, beta = 0.5, gamma = 0.3)
  expect_s3_class(plot, "ggplot")
})

test_that("inf_plot_3pl produces valid probability values", {
  plot <- inf_plot_3pl(alpha = 1, beta = 0, gamma = 0.2)
  data <- plot$data
  
  expect_true(all(data$p >= 0))
})

test_that("inf_plot_3pl respects custom theta_range", {
  plot <- inf_plot_3pl(theta_range = c(-3, 3), alpha = 1.5, beta = 0.5, gamma = 0.3)
  data <- plot$data
  
  expect_gte(min(data$theta), -3)
  expect_lte(max(data$theta), 3)
})

test_that("inf_plot_3pl throws an error for invalid y_lim", {
  expect_error(inf_plot_3pl(alpha = 1.5, beta = 0.5, gamma = 0.3, y_lim = -1)) # y_lim should be >= 0
  expect_error(inf_plot_3pl(alpha = 1.5, beta = 0.5, gamma = 0.3, y_lim = "text"))
  expect_error(inf_plot_3pl(alpha = 1.5, beta = 0.5, gamma = 0.3, y_lim = NA))
})

test_that("inf_plot_3pl throws an error for invalid alpha, beta, or gamma", {
  expect_error(inf_plot_3pl(alpha = "a", beta = 0.5, gamma = 0.3))
  expect_error(inf_plot_3pl(alpha = 1, beta = "b", gamma = 0.3))
  expect_error(inf_plot_3pl(alpha = 1, beta = 0.5, gamma = "c"))
  expect_error(inf_plot_3pl(alpha = NA, beta = 0.5, gamma = 0.3))
  expect_error(inf_plot_3pl(alpha = 1, beta = 0.5, gamma = -0.1))  # gamma should be in [0,1]
  expect_error(inf_plot_3pl(alpha = 1, beta = 0.5, gamma = 1.2))   # gamma should be in [0,1]
})

# Own check; y-axis limit
test_that("limits of y-axis are changed when y_lim argument is used", {
  plot <- inf_plot_3pl(alpha = 2, beta = c(1), gamma = 0.9, y_lim = 20)
  limits <- plot$scales$scales[[2]]$limits
  expect_true(all(limits == c(0, 20)))
})
