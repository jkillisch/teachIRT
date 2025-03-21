# These unit tests were written by ChatGPT.

test_that("p_tirt returns correct probability for symmetric input", {
  p <- p_tirt(
    theta = c(0, 0),
    mu = c(0, 0),
    lambda = c(1, 1),
    psi2 = c(1, 1)
  )
  
  expect_type(p, "double")
  expect_length(p, 1)
  expect_equal(p, 0.5, tolerance = 1e-6)
})

test_that("p_tirt returns higher probability when first item is favored", {
  p <- p_tirt(
    theta = c(1, 0),
    mu = c(0.2, -0.2),
    lambda = c(1, 1),
    psi2 = c(1, 1)
  )
  
  expect_gt(p, 0.5)
})

test_that("p_tirt returns lower probability when second item is favored", {
  p <- p_tirt(
    theta = c(0, 1),
    mu = c(0, 0.4),
    lambda = c(1, 1),
    psi2 = c(1, 1)
  )
  
  expect_lt(p, 0.5)
})

test_that("p_tirt throws error for invalid inputs", {
  expect_error(p_tirt(c(1), c(0,0), c(1,1), c(1,1)))       # theta wrong length
  expect_error(p_tirt(c(1,0), c(0), c(1,1), c(1,1)))       # mu wrong length
  expect_error(p_tirt(c(1,0), c(0,0), c(1), c(1,1)))       # lambda wrong length
  expect_error(p_tirt(c(1,0), c(0,0), c(1,1), c(1)))       # psi2 wrong length
  expect_error(p_tirt(c(NA,0), c(0,0), c(1,1), c(1,1)))    # missing theta
  expect_error(p_tirt(c(1,0), c(NA,0), c(1,1), c(1,1)))    # missing mu
  expect_error(p_tirt(c(1,0), c(0,0), c(NA,1), c(1,1)))    # missing lambda
  expect_error(p_tirt(c(1,0), c(0,0), c(1,1), c(NA,1)))    # missing psi2
})

