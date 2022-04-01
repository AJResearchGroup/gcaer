check_scores_table <- function(scores_table) {
  testthat::expect_true(tibble::is_tibble(scores_table))
  testthat::expect_true("score" %in% names(scores_table))
  testthat::expect_true("value" %in% names(scores_table))
  testthat::expect_true("epoch" %in% names(scores_table))
  invisible(scores_table)
}
