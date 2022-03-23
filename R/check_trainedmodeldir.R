#' Check if the `trainedmodeldir` is valid
#'
#' Check if the `trainedmodeldir` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `trainedmodeldir` is invalid.
#' @examples
#' check_trainedmodeldir("ae_out/")
#' @author Richèl J.C. Bilderbeek
#' @export
check_trainedmodeldir <- function(
  trainedmodeldir
) {
  testthat::expect_equal(1, length(trainedmodeldir))
  testthat::expect_true(is.character(trainedmodeldir))
  testthat::expect_true(nchar(trainedmodeldir) > 0)
  testthat::expect_true(nchar(trainedmodeldir) > 1)
  if (stringr::str_sub(trainedmodeldir, start = -1) != "/") {
    stop(
      "'trainedmodeldir' must end with a slash ('/'). \n",
      "trainedmodeldir: ", trainedmodeldir
    )
  }
}
