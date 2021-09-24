#' Check if the `datadir` is valid
#'
#' Check if the `datadir` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `datadir` is invalid.
#' @examples
#' check_datadir("my_datadir/")
#' @author Richèl J.C. Bilderbeek
#' @export
check_datadir <- function(
  datadir
) {
  testthat::expect_equal(1, length(datadir))
  testthat::expect_true(is.character(datadir))
  if (stringr::str_sub(datadir, start = 1, end = 1) == ".") {
    stop(
      "'datadir' cannot be or start with a full stop ('.') to specify ",
        "the current working directory. \n",
      "datadir: ", datadir, " \n",
      "Tip 1: In R, use 'paste0(getwd(), \"/\")' instead \n",
      "Tip 2: In bash, use '\"$PWD/\"' instead"
    )
  }
  testthat::expect_true(nchar(datadir) > 1)
  if (stringr::str_sub(datadir, start = -1) != "/") {
    stop(
      "'datadir' must end with a slash ('/'). \n",
      "datadir: ", datadir
    )
  }

}
