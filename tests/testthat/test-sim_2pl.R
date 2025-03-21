# These unit tests were written by ChatGPT.

test_that("sim_2pl returns a data.frame with correct dimensions", {
  n <- 10
  m <- 5
  df <- sim_2pl(n, m)
  
  expect_s3_class(df, "data.frame")
  expect_equal(nrow(df), n)
  expect_equal(ncol(df), m)
})

test_that("sim_2pl returns binary (0/1) responses", {
  df <- sim_2pl(6, 4)
  responses <- unlist(df)
  
  expect_true(all(responses %in% c(0, 1)))
})

test_that("sim_2pl includes correct row and column names", {
  df <- sim_2pl(3, 2)
  
  expect_equal(rownames(df), c("person1", "person2", "person3"))
  expect_equal(colnames(df), c("item_1", "item_2"))
})

test_that("sim_2pl throws errors for invalid inputs", {
  expect_error(sim_2pl(0, 4))       # n too small
  expect_error(sim_2pl(5, 0))       # m too small
  
  expect_error(sim_2pl(NA, 5))      # NA
  expect_error(sim_2pl(5, NA))
  
  expect_error(sim_2pl("5", 5))     # non-numeric
  expect_error(sim_2pl(5, "5"))
  
  expect_error(sim_2pl(NULL, 5))    # NULL
  expect_error(sim_2pl(5, NULL))
  
  expect_error(sim_2pl(Inf, 5))     # Inf
  expect_error(sim_2pl(5, Inf))
})

test_that("sim_2pl output is reproducible with fixed seed", {
  set.seed(444)
  df1 <- sim_2pl(4, 3)
  
  set.seed(444)
  df2 <- sim_2pl(4, 3)
  
  expect_equal(df1, df2)
})

