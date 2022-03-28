#' Check if the `analyse_epochs` is valid
#'
#' Check if the `analyse_epochs` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `analyse_epochs` is invalid.
#' @examples
#' check_analyse_epochs(c(1, 2))
#' @author Richèl J.C. Bilderbeek
#' @export
check_analyse_epochs <- function(
  analyse_epochs
) {
  testthat::expect_true(length(analyse_epochs) >= 1)
  testthat::expect_true(is.numeric(analyse_epochs))
  testthat::expect_true(is.finite(analyse_epochs))
  testthat::expect_equal(analyse_epochs, round(analyse_epochs))
  testthat::expect_true(analyse_epochs >= 1)
}
