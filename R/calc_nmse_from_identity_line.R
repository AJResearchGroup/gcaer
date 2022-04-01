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
  # 'normalize_true_and_estimated_values' checks input
  normalized_values <- gcaer::normalize_true_and_estimated_values(
    true_values = true_values,
    estimated_values = estimated_values
  )
  gcaer::calc_mse_from_identity_line(
    true_values = normalized_values$normalized_true_values,
    estimated_values = normalized_values$normalized_estimated_values
  )
}
