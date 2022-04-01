test_that("no error", {
  true_values <- c(0, 1)
  estimated_values <- true_values
  normalized_true_and_estimated_values <- normalize_true_and_estimated_values(
    true_values = true_values,
    estimated_values = estimated_values
  )
})

test_that("calculated error", {
  true_values <- c(0, 0)
  estimated_values <- c(1, 2)
  expect_error(
    normalize_true_and_estimated_values(
      true_values = true_values,
      estimated_values = estimated_values
    ),
    "The distribution of 'true_value' must have a non-zero standard deviation"
  )
})
