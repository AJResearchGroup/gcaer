#' Check if the `python_version` is valid
#'
#' Check if the `python_version` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `python_version` is invalid.
#' @examples
#' check_python_version("3.6")
#' @author Richèl J.C. Bilderbeek
#' @export
check_python_version <- function(
  python_version
) {
  testthat::expect_equal(1, length(python_version))
  testthat::expect_true(is.character(python_version))
  testthat::expect_true(nchar(python_version) > 0)
}
