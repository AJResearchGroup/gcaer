#' Check if the `folder_name` is valid
#'
#' Check if the `folder_name` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `folder_name` is invalid.
#' @examples
#' check_folder_name(".")
#' check_folder_name("~/my_folder")
#' check_folder_name("~/my_folder/")
#' check_folder_name("/home/my_folder")
#' check_folder_name("/home/my_folder/")
#' @author Richèl J.C. Bilderbeek
#' @export
check_folder_name <- function(
  folder_name
) {
  testthat::expect_equal(1, length(folder_name))
  testthat::expect_true(is.character(folder_name))
  testthat::expect_true(nchar(folder_name) > 0)
  if (
    !stringr::str_detect(
      string = folder_name,
      pattern = "^[[:graph:]]+$"
    )
  ) {
    stop(
      "'folder_name' must match regex '^[[:graph:]]+' \n",
      "folder_name: ", folder_name
    )
  }
}
