
# These unit tests were written by ChatGPT

test_that("sim_pcm returns a data.frame with correct dimensions", {
  n <- 4
  m <- 3
  m_star <- 2
  df <- sim_pcm(n, m, m_star)
  
  expect_s3_class(df, "data.frame")
  expect_equal(nrow(df), n)
  expect_equal(ncol(df), m)
})

test_that("sim_pcm returns only integer scores from 0 to m_star", {
  n <- 10
  m <- 5
  m_star <- 3
  df <- sim_pcm(n, m, m_star)
  responses <- unlist(df)
  
  expect_true(all(responses %in% 0:m_star))
  expect_true(all(responses %% 1 == 0))  # ensure integer scores
})

test_that("row and column names are properly labeled", {
  df <- sim_pcm(2, 2, 3)
  
  expect_equal(rownames(df), c("person1", "person2"))
  expect_equal(colnames(df), c("item_1", "item_2"))
})

test_that("sim_pcm throws errors for invalid inputs", {
  expect_error(sim_pcm(0, 3, 3))        # n too small
  expect_error(sim_pcm(5, 0, 3))        # m too small
  expect_error(sim_pcm(5, 3, 1))        # m_star too small
  
  expect_error(sim_pcm(NA, 3, 3))       # NA for n
  expect_error(sim_pcm(5, NA, 3))       # NA for m
  expect_error(sim_pcm(5, 3, NA))       # NA for m_star
  
  expect_error(sim_pcm("10", 3, 3))     # string for n
  expect_error(sim_pcm(5, "3", 3))      # string for m
  expect_error(sim_pcm(5, 3, "3"))      # string for m_star
  
  expect_error(sim_pcm(NULL, 3, 3))     # NULL for n
  expect_error(sim_pcm(5, NULL, 3))     # NULL for m
  expect_error(sim_pcm(5, 3, NULL))     # NULL for m_star
  
  expect_error(sim_pcm(Inf, 3, 3))      # Inf for n
  expect_error(sim_pcm(5, Inf, 3))      # Inf for m
  expect_error(sim_pcm(5, 3, Inf))      # Inf for m_star
})

test_that("sim_pcm output is reproducible with same seed", {
  set.seed(101)
  df1 <- sim_pcm(4, 3, 2)
  
  set.seed(101)
  df2 <- sim_pcm(4, 3, 2)
  
  expect_equal(df1, df2)
})
