#' Normalize the true and estimated values
#'
#' Normalize the true and estimated values.
#' @inheritParams default_params_doc
#' @return the result of \link[gganimate]{animate}
#' @author Richèl J.C. Bilderbeek
#' @export
normalize_true_and_estimated_values <- function(
  true_values,
  estimated_values
) {
  testthat::expect_true(is.numeric(true_values))
  testthat::expect_true(is.numeric(estimated_values))
  testthat::expect_equal(length(true_values), length(estimated_values))
  mean <- mean(true_values)
  sd <- sd(true_values)
  if (sd == 0) {
    stop(
      "The distribution of 'true_value' must have ",
      "a non-zero standard deviation, \n",
      "as these values will be transformed ",
      "to have a standard deviation of 1.0. \n"
    )
  }
  testthat::expect_true(sd > 0.0)
  normalized_true_values <- (true_values - mean) / sd
  normalized_estimated_values <- (estimated_values - mean) / sd
  list(
    normalized_true_values = normalized_true_values,
    normalized_estimated_values = normalized_estimated_values
  )
}
