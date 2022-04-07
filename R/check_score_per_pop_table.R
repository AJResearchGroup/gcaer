#' Create a `score_per_pop_table` to be used in testing
#'
#' Create a `score_per_pop_table` to be used in testing
#' @inheritParams default_params_doc
#' @return a `score_per_pop_table`
#' @examples
#' check_score_per_pop_table(create_test_score_per_pop_table())
#' @author Richèl J.C. Bilderbeek
#' @export
check_score_per_pop_table <- function(score_per_pop_table) {
  testthat::expect_true(tibble::is_tibble(score_per_pop_table))
  testthat::expect_true("population" %in% names(score_per_pop_table))
  testthat::expect_true("name" %in% names(score_per_pop_table))
  testthat::expect_true("value" %in% names(score_per_pop_table))
  testthat::expect_true("epoch" %in% names(score_per_pop_table))
}
