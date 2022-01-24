#' Check if the `ormr_folder_name` is valid
#'
#' Check if the `ormr_folder_name` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `ormr_folder_name` is invalid.
#' @examples
#' check_ormr_folder_name("my_folder")
#' @author Richèl J.C. Bilderbeek
#' @export
check_ormr_folder_name <- function(
  ormr_folder_name
) {
  testthat::expect_equal(1, length(ormr_folder_name))
  testthat::expect_true(is.character(ormr_folder_name))
  testthat::expect_true(nchar(ormr_folder_name) > 0)
}
