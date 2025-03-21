# These unit tests were written by ChatGPT.

test_that("p_2pl returns a numeric probability between 0 and 1", {
  p <- p_2pl(theta = 0, alpha = 1, beta = 0)
  
  expect_type(p, "double")
  expect_length(p, 1)
  expect_gte(p, 0)
  expect_lte(p, 1)
})

test_that("p_2pl gives 0.5 when theta equals beta and alpha = 1", {
  p <- p_2pl(theta = 0.5, alpha = 1, beta = 0.5)
  expect_equal(p, 0.5, tolerance = 1e-6)
})

test_that("p_2pl increases with higher theta when alpha > 0", {
  p1 <- p_2pl(theta = -1, alpha = 1, beta = 0)
  p2 <- p_2pl(theta = 0, alpha = 1, beta = 0)
  p3 <- p_2pl(theta = 1, alpha = 1, beta = 0)
  
  expect_lt(p1, p2)
  expect_lt(p2, p3)
})

test_that("p_2pl gives same result as Rasch model when alpha = 1", {
  p_rasch_equiv <- p_rasch(theta = 1, beta = 0.5)
  p_2pl_equiv <- p_2pl(theta = 1, alpha = 1, beta = 0.5)
  
  expect_equal(p_2pl_equiv, p_rasch_equiv, tolerance = 1e-6)
})

test_that("p_2pl is close to 0 with low theta and high beta", {
  p <- p_2pl(theta = -5, alpha = 1.5, beta = 3)
  expect_lt(p, 0.01)
})
