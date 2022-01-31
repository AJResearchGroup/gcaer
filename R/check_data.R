#' Check if the `data` is valid
#'
#' Check if the `data` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `data` is invalid.
#' @seealso to check the input data files, use \link{check_gcae_input_data}
#' @examples
#' check_data("HumanOrigins249_tiny")
#' @author Richèl J.C. Bilderbeek
#' @export
check_data <- function(
  data
) {
  testthat::expect_equal(1, length(data))
  testthat::expect_true(is.character(data))
  testthat::expect_true(nchar(data) > 0)
}
