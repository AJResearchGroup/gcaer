check_scores_per_pop_table <- function(scores_per_pop_table) {
  testthat::expect_true(tibble::is_tibble(scores_per_pop_table))
  testthat::expect_true("population" %in% names(scores_per_pop_table))
  testthat::expect_true("name" %in% names(scores_per_pop_table))
  testthat::expect_true("value" %in% names(scores_per_pop_table))
  testthat::expect_true("epoch" %in% names(scores_per_pop_table))
}
