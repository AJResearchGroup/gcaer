#' Get the `datadir` for use in testing.
#'
#' Get the `datadir` (as can be checked by \link{check_datadir})
#' for use in testing.
#' @return a `datadir`
#' @examples
#' get_test_datadir()
#' @author Richèl J.C. Bilderbeek
#' @export
get_test_datadir <- function() {
  paste0(system.file("extdata", package = "gcaer"), "/")
}
