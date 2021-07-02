#' Check if the `save_interval` is valid
#'
#' Check if the `save_interval` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `save_interval` is invalid.
#' @author Richèl J.C. Bilderbeek
#' @export
check_save_interval <- function(
  save_interval
) {
  testthat::expect_equal(1, length(save_interval))
  testthat::expect_true(is.numeric(save_interval))
  testthat::expect_true(is.finite(save_interval))
  testthat::expect_equal(save_interval, round(save_interval))
  testthat::expect_true(save_interval >= 1)
}
