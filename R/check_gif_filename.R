#' Check if the `gif_filename` is valid
#'
#' Check if the `gif_filename` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `gif_filename` is invalid.
#' @examples
#' check_gif_filename("my.gif")
#' @author Richèl J.C. Bilderbeek
#' @export
check_gif_filename <- function(
  gif_filename
) {
  testthat::expect_equal(1, length(gif_filename))
  testthat::expect_true(is.character(gif_filename))
  testthat::expect_true(nchar(gif_filename) > 0)
  if (
    !stringr::str_detect(
      string = gif_filename,
      pattern = "^[[:graph:]]+\\.gif$"
    )
  ) {
    stop(
      "'gif_filename' must match regex '^[[:graph:]]+\\.gif$' \n",
      "gif_filename: ", gif_filename
    )
  }
}
