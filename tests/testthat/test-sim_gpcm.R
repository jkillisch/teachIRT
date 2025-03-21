# These unit tests were written by ChatGPT.

test_that("sim_gpcm returns a data.frame of correct dimensions", {
  n <- 6
  m <- 4
  m_star <- 3
  df <- sim_gpcm(n, m, m_star)
  
  expect_s3_class(df, "data.frame")
  expect_equal(nrow(df), n)
  expect_equal(ncol(df), m)
})

test_that("sim_gpcm output values are integers between 0 and m_star", {
  df <- sim_gpcm(10, 5, 4)
  responses <- unlist(df)
  
  expect_true(all(responses %in% 0:4))
  expect_true(all(responses %% 1 == 0))  # Ensure integer
})

test_that("sim_gpcm row and column names are correct", {
  df <- sim_gpcm(2, 2, 3)
  
  expect_equal(rownames(df), c("person1", "person2"))
  expect_equal(colnames(df), c("item_1", "item_2"))
})

test_that("sim_gpcm throws errors for invalid inputs", {
  expect_error(sim_gpcm(0, 3, 3))         # n too small
  expect_error(sim_gpcm(5, 0, 3))         # m too small
  expect_error(sim_gpcm(5, 3, 1))         # m_star too small
  
  expect_error(sim_gpcm(NA, 3, 3))        # NA for n
  expect_error(sim_gpcm(5, NA, 3))        # NA for m
  expect_error(sim_gpcm(5, 3, NA))        # NA for m_star
  
  expect_error(sim_gpcm("5", 3, 3))       # non-numeric
  expect_error(sim_gpcm(5, "3", 3))
  expect_error(sim_gpcm(5, 3, "3"))
  
  expect_error(sim_gpcm(NULL, 3, 3))      # NULL
  expect_error(sim_gpcm(5, NULL, 3))
  expect_error(sim_gpcm(5, 3, NULL))
  
  expect_error(sim_gpcm(Inf, 3, 3))       # Inf
  expect_error(sim_gpcm(5, Inf, 3))
  expect_error(sim_gpcm(5, 3, Inf))
})

test_that("sim_gpcm output is reproducible with the same seed", {
  set.seed(2024)
  df1 <- sim_gpcm(3, 3, 2)
  
  set.seed(2024)
  df2 <- sim_gpcm(3, 3, 2)
  
  expect_equal(df1, df2)
})
