# These unit tests were written by ChatGPT.

test_that("sim_alpha returns a numeric vector of correct length", {
  m <- 10
  alpha <- sim_alpha(m)
  
  expect_type(alpha, "double")
  expect_length(alpha, m)
})

test_that("sim_alpha values are centered around 1 with sd ~ 0.2", {
  set.seed(123)
  alpha <- sim_alpha(10000)
  
  expect_equal(mean(alpha), 1, tolerance = 0.02)
  expect_equal(sd(alpha), 0.2, tolerance = 0.02)
})

test_that("sim_alpha is reproducible with the same seed", {
  set.seed(2025)
  a1 <- sim_alpha(5)
  
  set.seed(2025)
  a2 <- sim_alpha(5)
  
  expect_equal(a1, a2)
})

test_that("sim_alpha throws errors for invalid inputs", {
  expect_error(sim_alpha(0))        # too small
  expect_error(sim_alpha(-5))       # negative
  expect_error(sim_alpha(NA))       # NA
  expect_error(sim_alpha("10"))     # string
  expect_error(sim_alpha(NULL))     # NULL
  expect_error(sim_alpha(Inf))      # Inf
})

