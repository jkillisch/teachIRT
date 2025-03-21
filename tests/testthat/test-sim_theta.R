
# These unit tests were written by ChatGPT

test_that("sim_theta returns a numeric vector of correct length", {
  n <- 10
  theta <- sim_theta(n)
  
  expect_type(theta, "double")
  expect_length(theta, n)
})

test_that("sim_theta produces approximately standard normal distribution", {
  set.seed(123)
  theta <- sim_theta(10000)
  
  expect_equal(mean(theta), 0, tolerance = 0.05)
  expect_equal(sd(theta), 1, tolerance = 0.05)
})

test_that("sim_theta returns same result with same seed", {
  set.seed(42)
  theta1 <- sim_theta(5)
  
  set.seed(42)
  theta2 <- sim_theta(5)
  
  expect_equal(theta1, theta2)
})

test_that("sim_theta throws error for invalid n", {
  expect_error(sim_theta(0))          # less than 1
  expect_error(sim_theta(-5))         # negative number
  expect_error(sim_theta(NA))         # NA input
  expect_error(sim_theta(NULL))       # NULL input
  expect_error(sim_theta(Inf))        # infinite input
  expect_error(sim_theta("ten"))      # wrong type
})
