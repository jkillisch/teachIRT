# These unit tests were written by ChatGPT.

test_that("inf_plot_rasch returns a ggplot object", {
  plot <- inf_plot_rasch(beta = 0.5)
  expect_s3_class(plot, "ggplot")
})

test_that("inf_plot_rasch produces valid probability values", {
  plot <- inf_plot_rasch(beta = 0)
  data <- plot$data
  
  expect_true(all(data$p >= 0 & data$p <= 0.25))
})

test_that("inf_plot_rasch respects custom theta_range", {
  plot <- inf_plot_rasch(theta_range = c(-3, 3), beta = 0.5)
  data <- plot$data
  
  expect_gte(min(data$theta), -3)
  expect_lte(max(data$theta), 3)
})

test_that("inf_plot_rasch throws an error for invalid beta", {
  expect_error(inf_plot_rasch(beta = "text"))
  expect_error(inf_plot_rasch(beta = NA))
  expect_error(inf_plot_rasch(beta = NULL))
})
