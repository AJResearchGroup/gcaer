test_that("x = y, so r_squared = 1", {
  # Example from https://www.wallstreetmojo.com/r-squared/
  n <- 1000
  true_values <- c(5, 10, 4, 1, 3)
  estimated_values <- c(24, 30, 22, 10, 18)
  r_squared <- calc_r_squared(
    true_values = true_values,
    estimated_values = estimated_values
  )
  expect_equal(r_squared, 0.8649, tolerance = 0.02)
})

test_that("no warnings when perfect fit", {
  true_values <- seq(1, 10)
  estimated_values <- true_values
  expect_silent(
    calc_r_squared(
      true_values = true_values,
      estimated_values = estimated_values
    )
  )
})

test_that("x = y, so r_squared = 1", {
  set.seed(314)
  n <- 1000
  true_values <- seq(1, n)
  estimated_values <- true_values + runif(n = n, min = -0.01, max = 0.01)
  r_squared <- calc_r_squared(
    true_values = true_values,
    estimated_values = estimated_values
  )
  expect_equal(r_squared, 1, tolerance = 0.01)
})

test_that("y = 1, so r_squared = 0", {
  set.seed(314)
  n <- 1000
  true_values <- seq(1, n)
  estimated_values <- rep(1, n) + runif(n = n, min = -0.01, max = 0.01)
  r_squared <- calc_r_squared(
    true_values = true_values,
    estimated_values = estimated_values
  )
  expect_equal(r_squared, 0.0, tolerance = 0.01)
})

test_that("use", {
  true_values <- seq(1, 360)
  estimated_values <- true_values + stats::runif(n = 360)
  r_squared <- calc_r_squared(
    true_values = true_values,
    estimated_values = estimated_values
  )
  expect_true(r_squared > 0.9)
})
