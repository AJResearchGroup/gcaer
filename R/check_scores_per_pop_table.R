#' Create a `scores_per_pop_table` to be used in testing
#'
#' Create a `scores_per_pop_table` to be used in testing
#' @inheritParams default_params_doc
#' @return a `scores_per_pop_table`
#' @examples
#' check_scores_per_pop_table(create_test_scores_per_pop_table())
#' @author Richèl J.C. Bilderbeek
#' @export
check_scores_per_pop_table <- function(scores_per_pop_table) {
  testthat::expect_true(tibble::is_tibble(scores_per_pop_table))
  testthat::expect_true("population" %in% names(scores_per_pop_table))
  testthat::expect_true("name" %in% names(scores_per_pop_table))
  testthat::expect_true("value" %in% names(scores_per_pop_table))
  testthat::expect_true("epoch" %in% names(scores_per_pop_table))
}
