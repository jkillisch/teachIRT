# These unit tests were written by ChatGPT.

test_that("sim_beta returns a numeric vector of correct length", {
  m <- 10
  beta <- sim_beta(m)
  
  expect_type(beta, "double")
  expect_length(beta, m)
})

test_that("sim_beta output resembles a standard normal distribution", {
  set.seed(123)
  beta <- sim_beta(10000)
  
  expect_equal(mean(beta), 0, tolerance = 0.05)
  expect_equal(sd(beta), 1, tolerance = 0.05)
})

test_that("sim_beta is reproducible with the same seed", {
  set.seed(2025)
  b1 <- sim_beta(5)
  
  set.seed(2025)
  b2 <- sim_beta(5)
  
  expect_equal(b1, b2)
})

test_that("sim_beta throws errors for invalid inputs", {
  expect_error(sim_beta(0))        # m too small
  expect_error(sim_beta(-5))       # negative
  expect_error(sim_beta(NA))       # NA
  expect_error(sim_beta("10"))     # string
  expect_error(sim_beta(NULL))     # NULL
  expect_error(sim_beta(Inf))      # Inf
})

