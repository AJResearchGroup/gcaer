#' Calculate the `r_squared`
#'
#' Calculate the `r_squared`
#' @param true_values the true values
#' @param estimated_values the estimated values
#' @return the mean squared error from the identity line
#' @examples
#' true_values_degrees <- seq(1, 360)
#' estimated_values_degrees <- true_values_degrees + stats::runif(n = 360)
#' r_squared_degrees <- calc_r_squared(
#'   true_values = true_values_degrees,
#'   estimated_values = estimated_values_degrees
#' )
#' r_squared_degrees
#'
#' # Convert degrees to radians
#' true_values_radians <- 2.0 * pi * true_values_degrees / 360
#' estimated_values_radians <- 2.0 * pi * estimated_values_degrees / 360
#' r_squared_radians <- calc_r_squared(
#'   true_values = true_values_radians,
#'   estimated_values = estimated_values_radians
#' )
#' r_squared_radians
#'
#' # mse_degrees and mse_radians are the same, due to their normalized scales
#' @author Richèl J.C. Bilderbeek
#' @export
calc_r_squared <- function(
  true_values,
  estimated_values
) {
  testthat::expect_true(is.numeric(true_values))
  testthat::expect_true(is.numeric(estimated_values))
  testthat::expect_equal(length(true_values), length(estimated_values))
  suppressWarnings(summary(lm(estimated_values ~ true_values)))$r.squared
}
