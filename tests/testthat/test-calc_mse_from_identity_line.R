test_that("no error", {

  true_values <- c(0, 1)
  estimated_values <- true_values
  expect_equal(
    0.0,
    calc_mse_from_identity_line(
      true_values = true_values,
      estimated_values = estimated_values
    )
  )
})

test_that("calculated error", {

  true_values <- c(0, 0)
  estimated_values <- c(1, 2)
  expect_equal(
    mean(c(1.0 ^ 2, 2.0 ^ 2)),
    calc_mse_from_identity_line(
      true_values = true_values,
      estimated_values = estimated_values
    )
  )
})

test_that("calculated error", {

  true_values <- c(0, 0)
  estimated_values <- true_values + 2
  expect_equal(
    4,
    calc_mse_from_identity_line(
      true_values = true_values,
      estimated_values = estimated_values
    )
  )
})

test_that("show that scale matters", {
  true_values_degrees <- seq(1, 360)
  estimated_values_degrees <- true_values_degrees + runif(n = 360)
  expect_equal(length(true_values_degrees), length(estimated_values_degrees))
  mse_degrees <- calc_mse_from_identity_line(
    true_values = true_values_degrees,
    estimated_values = estimated_values_degrees
  )
  mse_degrees

  true_values_radians <- 2.0 * pi * true_values_degrees / 360
  estimated_values_radians <- 2.0 * pi * estimated_values_degrees / 360
  mse_radians <- calc_mse_from_identity_line(
    true_values = true_values_radians,
    estimated_values = estimated_values_radians
  )
  mse_radians

  # These are different, hence use an infinite tolerance
  expect_equal(2.0 * pi * mse_degrees / 360, mse_radians, tolerance = Inf)
})
