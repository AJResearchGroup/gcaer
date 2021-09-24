#' Check if the `data_opts_id` is valid
#'
#' Check if the `data_opts_id` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `data_opts_id` is invalid.
#' @examples
#' check_data_opts_id("b_0_4")
#' @author Richèl J.C. Bilderbeek
#' @export
check_data_opts_id <- function(
  data_opts_id
) {
  testthat::expect_equal(1, length(data_opts_id))
  testthat::expect_true(is.character(data_opts_id))
  testthat::expect_true(nchar(data_opts_id) > 0)
}
