#' Calculate the mean squared error from the identity line.
#'
#' Calculate the mean squared error from the identity line
#' (i.e. the line `y = x`).
#' If the estimated values are equal to the true values, the MSE is zero.
#' @param true_values the true values
#' @param estimated_values the estimated values
#' @return the mean squared error from the identity line
#' @seealso use \link{calc_nmse_from_identity_line} to calculate the
#' normalized mean square error from the identity line
#' @examples
#' true_values_degrees <- seq(1, 360)
#' estimated_values_degrees <- true_values_degrees + stats::runif(n = 360)
#' mse_degrees <- calc_mse_from_identity_line(
#'   true_values = true_values_degrees,
#'   estimated_values = estimated_values_degrees
#' )
#' mse_degrees
#'
#' # Convert degrees to radians
#' true_values_radians <- 2.0 * pi * true_values_degrees / 360
#' estimated_values_radians <- 2.0 * pi * estimated_values_degrees / 360
#' mse_radians <- calc_mse_from_identity_line(
#'   true_values = true_values_radians,
#'   estimated_values = estimated_values_radians
#' )
#' mse_radians
#'
#' # mse_degrees and mse_radians differ, due to their different scales,
#' # use 'calc_nmse_from_identity_line' to normalize the scale first
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
