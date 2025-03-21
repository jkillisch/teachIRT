# These unit tests were written by ChatGPT.

test_that("p_3pl returns a valid probability between 0 and 1", {
  p <- p_3pl(theta = 0, alpha = 1, beta = 0, gamma = 0.2)
  
  expect_type(p, "double")
  expect_length(p, 1)
  expect_gte(p, 0)
  expect_lte(p, 1)
})

test_that("p_3pl equals gamma when p_2pl is near zero", {
  p <- p_3pl(theta = -10, alpha = 2, beta = 0, gamma = 0.25)
  expect_equal(p, 0.25, tolerance = 1e-3)
})

test_that("p_3pl approaches 1 when p_2pl is near one", {
  p <- p_3pl(theta = 10, alpha = 2, beta = 0, gamma = 0.25)
  expect_equal(p, 1, tolerance = 1e-3)
})

test_that("p_3pl reduces to p_2pl when gamma is zero", {
  p_3 <- p_3pl(theta = 0.5, alpha = 1.5, beta = 0, gamma = 0)
  p_2 <- p_2pl(theta = 0.5, alpha = 1.5, beta = 0)
  
  expect_equal(p_3, p_2, tolerance = 1e-6)
})

test_that("p_3pl throws error for invalid gamma", {
  expect_error(p_3pl(theta = 0, alpha = 1, beta = 0, gamma = -0.1))
  expect_error(p_3pl(theta = 0, alpha = 1, beta = 0, gamma = 1.1))
  expect_error(p_3pl(theta = 0, alpha = 1, beta = 0, gamma = NA))
  expect_error(p_3pl(theta = 0, alpha = 1, beta = 0, gamma = "0.2"))
})
