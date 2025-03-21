
# These unit tests were written by ChatGPT

test_that("sim_rasch returns a data.frame with correct dimensions", {
  n <- 5
  m <- 3
  df <- sim_rasch(n, m)
  
  expect_s3_class(df, "data.frame")
  expect_equal(nrow(df), n)
  expect_equal(ncol(df), m)
})

test_that("sim_rasch contains only binary values (0 or 1)", {
  set.seed(123)
  df <- sim_rasch(10, 5)
  all_values <- unlist(df)
  
  expect_true(all(all_values %in% c(0, 1)))
})

test_that("sim_rasch row and column names are correctly formatted", {
  df <- sim_rasch(2, 2)
  expect_equal(rownames(df), c("person1", "person2"))
  expect_equal(colnames(df), c("item_1", "item_2"))
})

test_that("sim_rasch throws error for invalid inputs", {
  expect_error(sim_rasch(0, 3))        # invalid n
  expect_error(sim_rasch(5, 0))        # invalid m
  expect_error(sim_rasch(NA, 3))       # NA for n
  expect_error(sim_rasch(5, NA))       # NA for m
  expect_error(sim_rasch("5", 3))      # string for n
  expect_error(sim_rasch(5, "3"))      # string for m
  expect_error(sim_rasch(NULL, 3))     # NULL for n
  expect_error(sim_rasch(5, NULL))     # NULL for m
  expect_error(sim_rasch(Inf, 3))      # Inf for n
  expect_error(sim_rasch(5, Inf))      # Inf for m
})

test_that("sim_rasch output is reproducible with same seed", {
  set.seed(101)
  df1 <- sim_rasch(4, 4)
  
  set.seed(101)
  df2 <- sim_rasch(4, 4)
  
  expect_equal(df1, df2)
})
