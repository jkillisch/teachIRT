test_that("get_z gives known values", {
  
  expect_equal(
    get_z(1, "both"), 
    c(lower = 0, upper = 0), 
    tolerance = 1e-06
    )
  
  expect_equal(
    get_z(0, "both"), 
    c(lower = -Inf, upper = Inf), 
    tolerance = 1e-06
    )
  
  expect_equal(
    get_z(0.05, "both"), 
    c(lower = -1.959964, upper = 1.959964),
    tolerance = 1e-06
    )
  
  expect_equal(
    get_z(0.1, "both"), 
    c(lower = -1.644854, upper = 1.644854),
    tolerance = 1e-06
    )
  
  expect_equal(
    get_z(0.05, "lower"), 
    c(lower = -1.644854, upper = Inf),
    tolerance = 1e-06
  )
  
  expect_equal(
    get_z(0.1, "lower"), 
    c(lower = -1.281552, upper = Inf),
    tolerance = 1e-06
  )
  
  expect_equal(
    get_z(0.05, "upper"), 
    c(lower = -Inf, upper = 1.644854),
    tolerance = 1e-06
  )
  
  expect_equal(
    get_z(0.1, "upper"), 
    c(lower = -Inf, upper = 1.281552),
    tolerance = 1e-06
  )
  
})

test_that("get_z returns error for unexpected input", {
  
  expect_error(get_z(-0.5, "both"))
  expect_error(get_z(1.5, "both"))
  expect_error(get_z(0.05, "botht"))
  expect_error(get_z(NULL, "both"))
  expect_error(get_z(NA, "both"))
  expect_error(get_z(0.05, NULL))
  expect_error(get_z(0.05, NA))
  
})
