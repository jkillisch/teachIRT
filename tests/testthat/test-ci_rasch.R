test_that("ci_rasch returns known values", {
  
  expect_equal(
    ci_rasch(
      theta = 0,
      beta = 0,
      ci_alpha = 1,
      ci_direction = "both"
    ), 
    c(lower = 0, upper = 0)
    )
  
  expect_equal(
    ci_rasch(
      theta = 0,
      beta = 0,
      ci_alpha = 0,
      ci_direction = "both"
    ), 
    c(lower = -Inf, upper = Inf)
  )
  
  expect_equal(
    ci_rasch(
      theta = 0,
      beta = 0,
      ci_alpha = 0.05,
      ci_direction = "both"
    ), 
    c(lower = -3.919928, upper = 3.919928)
  )
  
  expect_equal(
    ci_rasch(
      theta = 0,
      beta = 0,
      ci_alpha = 0.05,
      ci_direction = "lower"
    ), 
    c(lower = -3.289707, upper = Inf),
    tolerance = 1e-07
  )
  
  expect_equal(
    ci_rasch(
      theta = 0,
      beta = 0,
      ci_alpha = 0.05,
      ci_direction = "upper"
    ), 
    c(lower = -Inf, upper = 3.289707),
    tolerance = 1e-07
  )
  
})

test_that("ci_rasch returns errors for wrong input", {
  
  expect_error(
    ci_rasch(
      theta = NA,
      beta = 0,
      ci_alpha = 1,
      ci_direction = "both"
    )
  )
  
  expect_error(
    ci_rasch(
      theta = NULL,
      beta = 0,
      ci_alpha = 1,
      ci_direction = "both"
    )
  )
  
  expect_error(
    ci_rasch(
      theta = 0,
      beta = NA,
      ci_alpha = 1,
      ci_direction = "both"
    )
  )
  
  expect_error(
    ci_rasch(
      theta = 0,
      beta = NULL,
      ci_alpha = 1,
      ci_direction = "both"
    )
  )
  
  expect_error(
    ci_rasch(
      theta = 0,
      beta = 0,
      ci_alpha = 1.5,
      ci_direction = "both"
    )
  )
  
  expect_error(
    ci_rasch(
      theta = 0,
      beta = 0,
      ci_alpha = -0.5,
      ci_direction = "both"
    )
  )
  
  expect_error(
    ci_rasch(
      theta = 0,
      beta = 0,
      ci_alpha = 0.5,
      ci_direction = "i4tjoer"
    )
  )
  
})


