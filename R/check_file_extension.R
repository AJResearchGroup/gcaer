#' Check if the `file_extension` is valid
#'
#' Check if the `file_extension` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `file_extension` is invalid.
#' @examples
#' check_file_extension(".R")
#' check_file_extension(".csv")
#' check_file_extension(".png")
#' @author Richèl J.C. Bilderbeek
#' @export
check_file_extension <- function(
  file_extension
) {
  testthat::expect_equal(1, length(file_extension))
  testthat::expect_true(is.character(file_extension))
  testthat::expect_true(nchar(file_extension) > 0)
  regex <- "^\\.[[:alpha:]]+$"
  if (
    !stringr::str_detect(
      string = file_extension,
      pattern = regex
    )
  ) {
    stop(
      "'file_extension' must match regex '", regex, "' \n",
      "file_extension: ", file_extension
    )
  }
}
