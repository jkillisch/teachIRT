# These unit tests were written by ChatGPT.

test_that("icc_pcm returns a ggplot object", {
  plot <- icc_pcm(delta = c(-1, 0, 1))
  expect_s3_class(plot, "ggplot")
})

test_that("icc_pcm returns correct number of category curves", {
  plot <- icc_pcm(delta = c(-2, 0, 1))
  data <- plot$data
  
  expect_true("cat" %in% names(data))
  expect_equal(length(unique(data$cat)), 4)  # m + 1 = 4
})

test_that("icc_pcm works with custom theta range", {
  plot <- icc_pcm(theta_range = c(-3, 3), delta = c(-1, 0, 1))
  data <- plot$data
  
  expect_gte(min(data$theta), -3)
  expect_lte(max(data$theta), 3)
})

test_that("icc_pcm produces probabilities within valid range", {
  plot <- icc_pcm(delta = c(-1, 0, 1))
  probs <- plot$data$p
  
  expect_true(all(probs >= 0 & probs <= 1))
})

test_that("icc_pcm throws error for non-numeric delta", {
  expect_error(icc_pcm(delta = "a"))
  expect_error(icc_pcm(delta = NA))
  expect_error(icc_pcm(delta = NULL))
})
