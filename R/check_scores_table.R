#' Check if the `scores_table` is valid
#'
#' Check if the `scores_table` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing.
#' Will \link{stop} if `scores_table` is invalid.
#' @examples
#' scores_table <- create_test_scores_table()
#' check_scores_table(scores_table)
#' @author Richèl J.C. Bilderbeek
#' @export
check_scores_table <- function(scores_table) {
  testthat::expect_true(tibble::is_tibble(scores_table))
  testthat::expect_true("score" %in% names(scores_table))
  testthat::expect_true("value" %in% names(scores_table))
  testthat::expect_true("epoch" %in% names(scores_table))
  invisible(scores_table)
}
