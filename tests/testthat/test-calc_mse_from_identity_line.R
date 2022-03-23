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
