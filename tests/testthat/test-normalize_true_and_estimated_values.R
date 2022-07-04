test_that("no error", {
  true_values <- c(0, 1)
  estimated_values <- true_values
  normalized_true_and_estimated_values <- normalize_true_and_estimated_values( # nolint indeed a long variable name
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

test_that("random values", {
  true_values <- runif(100, min = -30, max = 50)
  estimated_values <- sample(
    true_values,
    size = length(true_values),
    replace = FALSE
  )
  normalized_true_and_estimated_values <- normalize_true_and_estimated_values( # nolint indeed a long variable name
    true_values = true_values,
    estimated_values = estimated_values
  )
  expect_equal(
    0.0,
    mean(normalized_true_and_estimated_values$normalized_true_values)
  )
  expect_equal(
    1.0,
    sd(normalized_true_and_estimated_values$normalized_true_values)
  )
  expect_equal(
    0.0,
    mean(normalized_true_and_estimated_values$normalized_estimated_values)
  )
  expect_equal(
    1.0,
    sd(normalized_true_and_estimated_values$normalized_estimated_values)
  )
})
