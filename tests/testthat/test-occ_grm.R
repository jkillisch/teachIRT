# These unit tests were written by ChatGPT.

test_that("occ_grm returns a ggplot object", {
  plot <- occ_grm(alpha = 1.2, delta = c(-2, 0, 1.5))
  expect_s3_class(plot, "ggplot")
})

test_that("occ_grm returns correct number of OCC curves", {
  plot <- occ_grm(alpha = 1, delta = c(-1, 0, 1))
  data <- plot$data
  
  # There should be m + 1 curves (for each category)
  expected_n_cats <- length(unique(data$cat))
  expect_equal(expected_n_cats, length(c(-1, 0, 1)))
})

test_that("occ_grm handles custom theta ranges", {
  plot <- occ_grm(theta_range = c(-3, 3), alpha = 1.5, delta = c(-2, 1))
  data <- plot$data
  
  expect_gte(min(data$theta), -3)
  expect_lte(max(data$theta), 3)
})

test_that("occ_grm throws error if delta is not numeric", {
  expect_error(occ_grm(alpha = 1, delta = "not-numeric"))
  expect_error(occ_grm(alpha = 1, delta = NA))
  expect_error(occ_grm(alpha = 1, delta = NULL))
})
