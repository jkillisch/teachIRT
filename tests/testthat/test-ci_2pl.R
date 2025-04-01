test_that("ci_2pl returns known values", {
  
  expect_equal(
    ci_2pl(
      theta = 0,
      alpha = 1,
      beta = 0,
      ci_alpha = 1,
      ci_direction = "both"
    ), 
    c(lower = 0, upper = 0)
  )
  
  expect_equal(
    ci_2pl(
      theta = 0,
      beta = 0,
      alpha = 1,
      ci_alpha = 0,
      ci_direction = "both"
    ), 
    c(lower = -Inf, upper = Inf)
  )
  
  expect_equal(
    ci_2pl(
      theta = 0,
      beta = 0,
      alpha = 1,
      ci_alpha = 0.05,
      ci_direction = "both"
    ), 
    c(lower = -3.919928, upper = 3.919928)
  )
  
  expect_equal(
    ci_2pl(
      theta = 0,
      beta = 0,
      alpha = 1,
      ci_alpha = 0.05,
      ci_direction = "lower"
    ), 
    c(lower = -3.289707, upper = Inf),
    tolerance = 1e-07
  )
  
  expect_equal(
    ci_2pl(
      theta = 0,
      beta = 0,
      alpha = 1,
      ci_alpha = 0.05,
      ci_direction = "upper"
    ), 
    c(lower = -Inf, upper = 3.289707),
    tolerance = 1e-07
  )
  
})

test_that("ci_2pl returns errors for wrong input", {
  
  expect_error(
    ci_2pl(
      theta = NA,
      beta = 0,
      alpha = 1,
      ci_alpha = 1,
      ci_direction = "both"
    )
  )
  
  expect_error(
    ci_2pl(
      theta = NULL,
      beta = 0,
      alpha = 1,
      ci_alpha = 1,
      ci_direction = "both"
    )
  )
  
  expect_error(
    ci_2pl(
      theta = 0,
      beta = NA,
      alpha = 1,
      ci_alpha = 1,
      ci_direction = "both"
    )
  )
  
  expect_error(
    ci_2pl(
      theta = 0,
      beta = NULL,
      alpha = 1,
      ci_alpha = 1,
      ci_direction = "both"
    )
  )
  
  expect_error(
    ci_2pl(
      theta = 0,
      beta = 0,
      alpha = 1,
      ci_alpha = 1.5,
      ci_direction = "both"
    )
  )
  
  expect_error(
    ci_2pl(
      theta = 0,
      beta = 0,
      alpha = 1,
      ci_alpha = -0.5,
      ci_direction = "both"
    )
  )
  
  expect_error(
    ci_2pl(
      theta = 0,
      beta = 0,
      alpha = 1,
      ci_alpha = 0.5,
      ci_direction = "i4tjoer"
    )
  )
  
})


