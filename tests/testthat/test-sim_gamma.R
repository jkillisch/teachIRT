
# These unit tests were written by ChatGPT.

test_that("sim_gamma returns a numeric vector of correct length", {
  m <- 10
  gamma <- sim_gamma(m)
  
  expect_type(gamma, "double")
  expect_length(gamma, m)
})

test_that("sim_gamma values are within (0, 1)", {
  gamma <- sim_gamma(100)
  
  expect_true(all(gamma > 0))
  expect_true(all(gamma < 1))
})

test_that("sim_gamma values follow a beta(1, 5) distribution approximately", {
  set.seed(123)
  gamma <- sim_gamma(10000)
  
  expect_lt(mean(gamma), 0.2)   # Beta(1,5) has mean 1/6 ≈ 0.167
  expect_gt(mean(gamma), 0.1)
})

test_that("sim_gamma throws errors for invalid m", {
  expect_error(sim_gamma(0))        # too small
  expect_error(sim_gamma(-3))       # negative
  expect_error(sim_gamma(NA))       # NA
  expect_error(sim_gamma("10"))     # string
  expect_error(sim_gamma(NULL))     # NULL
  expect_error(sim_gamma(Inf))      # Inf
})

test_that("sim_gamma is reproducible with same seed", {
  set.seed(42)
  g1 <- sim_gamma(5)
  
  set.seed(42)
  g2 <- sim_gamma(5)
  
  expect_equal(g1, g2)
})
