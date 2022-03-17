#' Check if the `png_filename` is valid
#'
#' Check if the `png_filename` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `png_filename` is invalid.
#' @examples
#' check_png_filename("my.png")
#' @author Richèl J.C. Bilderbeek
#' @export
check_png_filename <- function(
  png_filename
) {
  testthat::expect_equal(1, length(png_filename))
  testthat::expect_true(is.character(png_filename))
  testthat::expect_true(nchar(png_filename) > 0)
  if (
    !stringr::str_detect(
      string = png_filename,
      pattern = "^[[:graph:]]+\\.png$"
    )
  ) {
    stop(
      "'png_filename' must match regex '^[[:graph:]]+\\.png$' \n",
      "png_filename: ", png_filename
    )
  }
}
