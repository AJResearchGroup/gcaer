#' Calculate the normalized mean squared error from the identity line.
#'
#' Calculate the normalized mean squared error from the identity line
#' (i.e. the line `y = x`).
#' If the estimated values are equal to the true values, the MSE is zero.
#' @param true_values the true values
#' @param estimated_values the estimated values
#' @return the mean squared error from the identity line
#' @seealso use \link{calc_mse_from_identity_line} to calculate the
#' (un-normalized) mean square error from the identity line
#' @examples
#' true_values_degrees <- seq(1, 360)
#' estimated_values_degrees <- true_values_degrees + stats::runif(n = 360)
#' nmse_degrees <- calc_nmse_from_identity_line(
#'   true_values = true_values_degrees,
#'   estimated_values = estimated_values_degrees
#' )
#' nmse_degrees
#'
#' # Convert degrees to radians
#' true_values_radians <- 2.0 * pi * true_values_degrees / 360
#' estimated_values_radians <- 2.0 * pi * estimated_values_degrees / 360
#' nmse_radians <- calc_nmse_from_identity_line(
#'   true_values = true_values_radians,
#'   estimated_values = estimated_values_radians
#' )
#' nmse_radians
#'
#' # mse_degrees and mse_radians are the same, due to their normalized scales
#' @author Richèl J.C. Bilderbeek
#' @export
calc_nmse_from_identity_line <- function(
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
  gcaer::calc_mse_from_identity_line(
    true_values = normalized_true_values,
    estimated_values = normalized_estimated_values
  )
}
