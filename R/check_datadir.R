#' Check if the `datadir` is valid
#'
#' Check if the `datadir` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `datadir` is invalid.
#' @author Richèl J.C. Bilderbeek
#' @export
check_datadir <- function(
  datadir
) {
  testthat::expect_equal(1, length(datadir))
  testthat::expect_true(is.character(datadir))
  testthat::expect_true(nchar(datadir) > 0)
}
