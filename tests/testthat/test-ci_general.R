test_that("ci_general gives returns known values correctly", {
  
  expect_equal(
    ci_general(theta = 0, inf = 0, ci_alpha = 0.05, ci_direction = "both"), 
    c(lower = -Inf, upper = Inf)
    )
  
  expect_equal(
    ci_general(theta = 0, inf = 1, ci_alpha = 0, ci_direction = "both"), 
    c(lower = -Inf, upper = Inf)
  )
  
  expect_equal(
    ci_general(theta = 0, inf = 1, ci_alpha = 1, ci_direction = "both"), 
    c(lower = 0, upper = 0)
  )
  
  expect_equal(
    ci_general(theta = 0, inf = 1, ci_alpha = 0.05, ci_direction = "both"), 
    get_z(ci_alpha = 0.05, ci_direction = "both")
  )
  
  expect_equal(
    ci_general(theta = 0, inf = 1, ci_alpha = 0.05, ci_direction = "lower"), 
    get_z(ci_alpha = 0.05, ci_direction = "lower")
  )
  
  expect_equal(
    ci_general(theta = 0, inf = 1, ci_alpha = 0.05, ci_direction = "upper"), 
    get_z(ci_alpha = 0.05, ci_direction = "upper")
  )
  
})

test_that("ci_general returns errors for wrong input", {
  
  expect_error(
    ci_general(theta = "a", inf = 0, ci_alpha = 0.05, ci_direction = "both")
  )
  
  expect_error(
    ci_general(theta = 0, inf = "a", ci_alpha = 0.05, ci_direction = "both")
  )
  
  expect_error(
    ci_general(theta = 0, inf = 0, ci_alpha = "0.05", ci_direction = "both")
  )
  
  expect_error(
    ci_general(theta = 0, inf = 0, ci_alpha = 0.05, ci_direction = 0)
  )
  
  expect_error(
    ci_general(theta = NA, inf = 0, ci_alpha = 0.05, ci_direction = "both")
  )
  
  expect_error(
    ci_general(theta = NULL, inf = 0, ci_alpha = 0.05, ci_direction = "both")
  )
  
  expect_error(
    ci_general(theta = 0, inf = NA, ci_alpha = 0.05, ci_direction = "both")
  )
  
  expect_error(
    ci_general(theta = 0, inf = NULL, ci_alpha = 0.05, ci_direction = "both")
  )
  
  expect_error(
    ci_general(theta = 0, inf = 0, ci_alpha = -0.5, ci_direction = "both")
  )
  
  expect_error(
    ci_general(theta = 0, inf = 0, ci_alpha = 1.5, ci_direction = "both")
  )
  
  expect_error(
    ci_general(theta = 0, inf = 0, ci_alpha = NA, ci_direction = "both")
  )
  
  expect_error(
    ci_general(theta = 0, inf = 0, ci_alpha = NULL, ci_direction = "both")
  )
  
})
