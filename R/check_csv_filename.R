#' Check if the `csv_filename` is valid
#'
#' Check if the `csv_filename` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `csv_filename` is invalid.
#' @examples
#' check_csv_filename("my.csv")
#' @author Richèl J.C. Bilderbeek
#' @export
check_csv_filename <- function(
  csv_filename
) {
  testthat::expect_equal(1, length(csv_filename))
  testthat::expect_true(is.character(csv_filename))
  testthat::expect_true(nchar(csv_filename) > 0)
  if (
    !stringr::str_detect(
      string = csv_filename,
      pattern = "^[[:graph:]]+\\.csv$"
    )
  ) {
    stop(
      "'csv_filename' must match regex '^[[:graph:]]+\\.csv$' \n",
      "csv_filename: ", csv_filename
    )
  }
}
