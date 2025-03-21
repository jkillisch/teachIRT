# These unit tests were written by ChatGPT.

test_that("inf_plot_2pl returns a ggplot object", {
  plot <- inf_plot_2pl(alpha = 1.2, beta = 1.5)
  expect_s3_class(plot, "ggplot")
})

test_that("inf_plot_2pl produces valid probability values", {
  plot <- inf_plot_2pl(alpha = 1, beta = 0)
  data <- plot$data
  
  expect_true(all(data$p >= 0))
})

test_that("inf_plot_2pl respects custom theta_range", {
  plot <- inf_plot_2pl(theta_range = c(-3, 3), alpha = 1.5, beta = 0)
  data <- plot$data
  
  expect_gte(min(data$theta), -3)
  expect_lte(max(data$theta), 3)
})

test_that("inf_plot_2pl throws an error for invalid y_lim", {
  expect_error(inf_plot_2pl(alpha = 1.5, beta = 0, y_lim = -1)) # y_lim should be >= 0
  expect_error(inf_plot_2pl(alpha = 1.5, beta = 0, y_lim = "text"))
  expect_error(inf_plot_2pl(alpha = 1.5, beta = 0, y_lim = NA))
})

test_that("inf_plot_2pl throws an error for invalid alpha or beta", {
  expect_error(inf_plot_2pl(alpha = "a", beta = 0))
  expect_error(inf_plot_2pl(alpha = 1, beta = "b"))
  expect_error(inf_plot_2pl(alpha = NA, beta = 0))
})

# Own check; y-axis limit
test_that("limits of y-axis are changed when y_lim argument is used", {
  plot <- inf_plot_2pl(alpha = 2, beta = c(1), y_lim = 20)
  limits <- plot$scales$scales[[2]]$limits
  expect_true(all(limits == c(0, 20)))
})

