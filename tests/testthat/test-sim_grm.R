# These unit tests were written by ChatGPT.

test_that("sim_grm returns a data.frame with correct dimensions", {
  n <- 5
  m <- 4
  m_star <- 3
  df <- sim_grm(n, m, m_star)
  
  expect_s3_class(df, "data.frame")
  expect_equal(nrow(df), n)
  expect_equal(ncol(df), m)
})

test_that("sim_grm only contains integers between 0 and m_star", {
  n <- 10
  m <- 6
  m_star <- 4
  df <- sim_grm(n, m, m_star)
  responses <- unlist(df)
  
  expect_true(all(responses %in% 0:m_star))
  expect_true(all(responses %% 1 == 0))
})

test_that("row and column names are formatted correctly", {
  df <- sim_grm(2, 2, 3)
  
  expect_equal(rownames(df), c("person1", "person2"))
  expect_equal(colnames(df), c("item_1", "item_2"))
})

test_that("sim_grm throws errors for invalid arguments", {
  expect_error(sim_grm(0, 3, 3))        # n too small
  expect_error(sim_grm(5, 0, 3))        # m too small
  expect_error(sim_grm(5, 3, 1))        # m_star too small
  
  expect_error(sim_grm(NA, 3, 3))       # NA for n
  expect_error(sim_grm(5, NA, 3))       # NA for m
  expect_error(sim_grm(5, 3, NA))       # NA for m_star
  
  expect_error(sim_grm("5", 3, 3))      # string input
  expect_error(sim_grm(5, "3", 3))
  expect_error(sim_grm(5, 3, "3"))
  
  expect_error(sim_grm(NULL, 3, 3))
  expect_error(sim_grm(5, NULL, 3))
  expect_error(sim_grm(5, 3, NULL))
  
  expect_error(sim_grm(Inf, 3, 3))
  expect_error(sim_grm(5, Inf, 3))
  expect_error(sim_grm(5, 3, Inf))
})

test_that("sim_grm is reproducible with same seed", {
  set.seed(999)
  df1 <- sim_grm(4, 4, 2)
  
  set.seed(999)
  df2 <- sim_grm(4, 4, 2)
  
  expect_equal(df1, df2)
})