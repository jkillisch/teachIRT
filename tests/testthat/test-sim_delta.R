# These unit tests were written by ChatGPT.

test_that("sim_delta returns a numeric vector of correct length", {
  m_star <- 4
  delta <- sim_delta(m_star)
  
  expect_type(delta, "double")
  expect_length(delta, m_star)
})

test_that("sim_delta output is sorted in increasing order", {
  delta <- sim_delta(5)
  
  expect_true(all(diff(delta) > 0))
})

test_that("sim_delta output is roughly centered on standard normal metric", {
  set.seed(1)
  delta <- sim_delta(6)
  
  expect_true(abs(mean(delta)) < 0.5)  # Not strict, but should be loosely centered
})

test_that("sim_delta throws error for invalid inputs", {
  expect_error(sim_delta(0))       # too small
  expect_error(sim_delta(1))       # must be >= 2
  expect_error(sim_delta(NA))      # NA
  expect_error(sim_delta("3"))     # string
  expect_error(sim_delta(NULL))    # NULL
  expect_error(sim_delta(Inf))     # Inf
})
