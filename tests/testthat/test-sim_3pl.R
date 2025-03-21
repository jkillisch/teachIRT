# These unit tests were written by ChatGPT.

test_that("sim_3pl returns a data.frame with correct dimensions", {
  n <- 8
  m <- 6
  df <- sim_3pl(n, m)
  
  expect_s3_class(df, "data.frame")
  expect_equal(nrow(df), n)
  expect_equal(ncol(df), m)
})

test_that("sim_3pl returns only binary responses (0 or 1)", {
  df <- sim_3pl(10, 5)
  responses <- unlist(df)
  
  expect_true(all(responses %in% c(0, 1)))
})

test_that("sim_3pl row and column names are properly formatted", {
  df <- sim_3pl(2, 2)
  
  expect_equal(rownames(df), c("person1", "person2"))
  expect_equal(colnames(df), c("item_1", "item_2"))
})

test_that("sim_3pl throws error for invalid inputs", {
  expect_error(sim_3pl(0, 3))         # n too small
  expect_error(sim_3pl(5, 0))         # m too small
  
  expect_error(sim_3pl(NA, 3))        # NA
  expect_error(sim_3pl(5, NA))
  
  expect_error(sim_3pl("10", 3))      # strings
  expect_error(sim_3pl(5, "3"))
  
  expect_error(sim_3pl(NULL, 3))      # NULL
  expect_error(sim_3pl(5, NULL))
  
  expect_error(sim_3pl(Inf, 3))       # Inf
  expect_error(sim_3pl(5, Inf))
})

test_that("sim_3pl output is reproducible with same seed", {
  set.seed(2025)
  df1 <- sim_3pl(3, 3)
  
  set.seed(2025)
  df2 <- sim_3pl(3, 3)
  
  expect_equal(df1, df2)
})

