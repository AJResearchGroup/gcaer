#' Check if the `superpops` is valid
#'
#' Check if the `superpops` is valid.
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `superpops` is invalid.
#' @seealso to read the input `superpops` file, which
#' hold the labels table, use \link{read_labels_file}
#' @examples
#' check_superpops("HumanOrigins249_tiny")
#'
#' # For those that do not care about the labels
#' check_superpops("")
#' @author Richèl J.C. Bilderbeek
#' @export
check_superpops <- function(
  superpops
) {
  testthat::expect_equal(1, length(superpops))
  testthat::expect_true(is.character(superpops))
  testthat::expect_true(nchar(superpops) >= 0)
}
