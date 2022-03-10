#' Check if the `epochs` is valid
#'
#' Check if the `epochs` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `epochs` is invalid.
#' @examples
#' check_epochs(100)
#' @author Richèl J.C. Bilderbeek
#' @export
check_epochs <- function(
  epochs
) {
  testthat::expect_equal(1, length(epochs))
  testthat::expect_true(is.numeric(epochs))
  testthat::expect_true(is.finite(epochs))
  testthat::expect_equal(epochs, round(epochs))
  testthat::expect_true(epochs >= 1)
}
