#' Check if the `train_opts_id` is valid
#'
#' Check if the `train_opts_id` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `train_opts_id` is invalid.
#' @examples
#' check_train_opts_id("ex3")
#' @author Richèl J.C. Bilderbeek
#' @export
check_train_opts_id <- function(
  train_opts_id
) {
  testthat::expect_equal(1, length(train_opts_id))
  testthat::expect_true(is.character(train_opts_id))
  testthat::expect_true(nchar(train_opts_id) > 0)
}
