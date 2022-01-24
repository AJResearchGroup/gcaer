#' Check if the `gcae_folder` is valid
#'
#' Check if the `gcae_folder` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `gcae_folder` is invalid.
#' @examples
#' check_gcae_folder("my_folder")
#' @author Richèl J.C. Bilderbeek
#' @export
check_gcae_folder <- function(
  gcae_folder
) {
  testthat::expect_equal(1, length(gcae_folder))
  testthat::expect_true(is.character(gcae_folder))
  testthat::expect_true(nchar(gcae_folder) > 0)
}
