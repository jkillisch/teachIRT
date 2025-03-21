# These unit tests were written by ChatGPT.

test_that("icc_gpcm returns a ggplot object", {
  plot <- icc_gpcm(alpha = 1.5, delta = c(-2, 0, 2))
  expect_s3_class(plot, "ggplot")
})

test_that("icc_gpcm returns correct number of category curves", {
  plot <- icc_gpcm(alpha = 1, delta = c(-2, 0))
  data <- plot$data
  
  expect_true("cat" %in% names(data))
  expect_equal(length(unique(data$cat)), 3)  # m + 1 = 3
})

test_that("icc_gpcm works with custom theta range", {
  plot <- icc_gpcm(theta_range = c(-2, 2), alpha = 1.5, delta = c(-1, 0, 1))
  data <- plot$data
  
  expect_gte(min(data$theta), -2)
  expect_lte(max(data$theta), 2)
})

test_that("icc_gpcm produces probabilities within [0, 1]", {
  plot <- icc_gpcm(alpha = 2, delta = c(-3, -1, 2))
  probs <- plot$data$p
  
  expect_true(all(probs >= 0 & probs <= 1))
})

test_that("icc_gpcm throws error for non-numeric delta or alpha", {
  expect_error(icc_gpcm(alpha = 1, delta = "a"))
  expect_error(icc_gpcm(alpha = 1, delta = NA))
  expect_error(icc_gpcm(alpha = 1, delta = NULL))
  expect_error(icc_gpcm(alpha = "a", delta = c(0, 1)))
  expect_error(icc_gpcm(alpha = NA, delta = c(0, 1)))
})
