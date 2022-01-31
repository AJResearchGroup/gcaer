#' Check if the `trainedmodelname` is valid
#'
#' Check if the `trainedmodelname` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `trainedmodelname` is invalid.
#' @examples
#' check_trainedmodeldir("ae_out")
#' @author Richèl J.C. Bilderbeek
#' @export
check_trainedmodeldir <- function(
  trainedmodelname
) {
  testthat::expect_equal(1, length(trainedmodelname))
  testthat::expect_true(is.character(trainedmodelname))
  testthat::expect_true(nchar(trainedmodelname) > 0)
}
