# These unit tests were written by ChatGPT.

test_that("ccc_grm returns a ggplot object", {
  plot <- ccc_grm(alpha = 1.2, delta = c(-2, -0.5, 1.5))
  expect_s3_class(plot, "ggplot")
})

test_that("ccc_grm returns correct number of category curves", {
  plot <- ccc_grm(alpha = 1, delta = c(-1, 0, 1))
  data <- plot$data
  
  expect_true("cat" %in% names(data))
  expect_equal(length(unique(data$cat)), 4)  # m + 1
})

test_that("ccc_grm respects custom theta_range", {
  plot <- ccc_grm(theta_range = c(-3, 3), alpha = 1.5, delta = c(-2, 1))
  data <- plot$data
  
  expect_gte(min(data$theta), -3)
  expect_lte(max(data$theta), 3)
})

test_that("ccc_grm produces probabilities within [0, 1]", {
  plot <- ccc_grm(alpha = 2, delta = c(-3, -1, 2))
  probs <- plot$data$p
  
  expect_true(all(probs >= 0 & probs <= 1))
})

test_that("ccc_grm throws error for invalid delta or alpha inputs", {
  expect_error(ccc_grm(alpha = 1, delta = "a"))
  expect_error(ccc_grm(alpha = "1", delta = c(0, 1)))
  expect_error(ccc_grm(alpha = 1, delta = NA))
  expect_error(ccc_grm(alpha = 1, delta = NULL))
})
