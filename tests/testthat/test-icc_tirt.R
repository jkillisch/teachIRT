# These unit tests were written by ChatGPT.

test_that("icc_tirt runs without errors and produces a plot", {
  expect_silent(
    icc_tirt(
      mu = c(0, -0.2), 
      lambda = c(0.7, 0.8), 
      psi2 = c(1, 1)
    )
  )
})

test_that("icc_tirt handles different theta_range values correctly", {
  expect_silent(
    icc_tirt(
      theta_range = c(-3, 3),
      mu = c(0, -0.5), 
      lambda = c(0.6, 0.9), 
      psi2 = c(1.2, 0.8)
    )
  )
})

test_that("icc_tirt throws an error for invalid theta_range values", {
  expect_error(icc_tirt(theta_range = c(5, -5), mu = c(0, -0.2), lambda = c(0.7, 0.8), psi2 = c(1, 1)))
  expect_error(icc_tirt(theta_range = c(NA, 5), mu = c(0, -0.2), lambda = c(0.7, 0.8), psi2 = c(1, 1)))
  expect_error(icc_tirt(theta_range = "not numeric", mu = c(0, -0.2), lambda = c(0.7, 0.8), psi2 = c(1, 1)))
})

test_that("icc_tirt throws an error for invalid mu, lambda, or psi2", {
  expect_error(icc_tirt(mu = "invalid", lambda = c(0.7, 0.8), psi2 = c(1, 1)))
  expect_error(icc_tirt(mu = c(0, -0.2), lambda = c("bad", 0.8), psi2 = c(1, 1)))
  expect_error(icc_tirt(mu = c(0, -0.2), lambda = c(0.7, 0.8), psi2 = "not numeric"))
})

test_that("icc_tirt handles different rotation angles correctly", {
  expect_silent(
    icc_tirt(
      mu = c(0, -0.2), 
      lambda = c(0.7, 0.8), 
      psi2 = c(1, 1), 
      rotation = -180
    )
  )
  expect_silent(
    icc_tirt(
      mu = c(0, -0.2), 
      lambda = c(0.7, 0.8), 
      psi2 = c(1, 1), 
      rotation = 0
    )
  )
  expect_silent(
    icc_tirt(
      mu = c(0, -0.2), 
      lambda = c(0.7, 0.8), 
      psi2 = c(1, 1), 
      rotation = 360
    )
  )
})

test_that("icc_tirt throws error for invalid rotation values", {
  expect_error(icc_tirt(mu = c(0, -0.2), lambda = c(0.7, 0.8), psi2 = c(1, 1), rotation = "wrong"))
  expect_error(icc_tirt(mu = c(0, -0.2), lambda = c(0.7, 0.8), psi2 = c(1, 1), rotation = NA))
})
