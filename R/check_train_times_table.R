#' Check if the `train_times_table` is valid
#'
#' Check if the `train_times_table` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing.
#' Will \link{stop} if `train_times_table` is invalid.
#' @examples
#' train_times_table <- create_test_train_times_table()
#' check_train_times_table(train_times_table)
#' @author Richèl J.C. Bilderbeek
#' @export
check_train_times_table <- function(train_times_table) { # nolint indeed a long function name
  testthat::expect_true(tibble::is_tibble(train_times_table))
  testthat::expect_true("epoch" %in% names(train_times_table))
  testthat::expect_true("train_time_sec" %in% names(train_times_table))
  invisible(train_times_table)
}
