test_that("no error", {

  true_values <- c(0, 1)
  estimated_values <- true_values
  expect_equal(
    0.0,
    calc_nmse_from_identity_line(
      true_values = true_values,
      estimated_values = estimated_values
    )
  )
})

test_that("calculated error", {

  true_values <- c(0, 0)
  estimated_values <- c(1, 2)
  expect_error(
    calc_nmse_from_identity_line(
      true_values = true_values,
      estimated_values = estimated_values
    ),
    "The distribution of 'true_value' must have a non-zero standard deviation"
  )

})

test_that("show that scale does not matters anymore", {

  true_values_degrees <- seq(1, 360)
  estimated_values_degrees <- true_values + runif(n = 360)
  expect_equal(length(true_values), length(estimated_values))
  mse_degrees <- calc_nmse_from_identity_line(
    true_values = true_values_degrees,
    estimated_values = estimated_values_degrees
  )

  true_values_radians <- 2.0 * pi * true_values_degrees / 360
  estimated_values_radians <- 2.0 * pi * estimated_values_degrees / 360
  mse_radians <- calc_nmse_from_identity_line(
    true_values = true_values_radians,
    estimated_values = estimated_values_radians
  )
  expect_equal(mse_degrees, mse_radians)
})
