#' Calculate the mean squared error from the identity line.
#'
#' Calculate the mean squared error from the identity line
#' (i.e. the line `y = x`).
#' If the estimated values are equal to the true values, the MSE is zero.
#' @param true_values the true values
#' @param estimated_values the estimated values
#' @return the mean squared error from the identity line
#' @author Richèl J.C. Bilderbeek
#' @export
calc_mse_from_identity_line <- function(
  true_values,
  estimated_values
) {
  testthat::expect_true(is.numeric(true_values))
  testthat::expect_true(is.numeric(estimated_values))
  testthat::expect_equal(length(true_values), length(estimated_values))
  squared_errors <- (true_values - estimated_values) ^ 2
  mean(squared_errors)
}
