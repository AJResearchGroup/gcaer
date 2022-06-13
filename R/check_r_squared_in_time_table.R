#' Check if the `r_squared_in_time_table` is valid
#'
#' Check if the `r_squared_in_time_table` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing.
#' Will \link{stop} if `r_squared_in_time_table` is invalid.
#' @examples
#' r_squared_in_time_table <- create_test_r_squared_in_time_table()
#' check_r_squared_in_time_table(r_squared_in_time_table)
#' @author Richèl J.C. Bilderbeek
#' @export
check_r_squared_in_time_table <- function(r_squared_in_time_table) { # nolint indeed a long function name
  testthat::expect_true(tibble::is_tibble(r_squared_in_time_table))
  testthat::expect_true("epoch" %in% names(r_squared_in_time_table))
  testthat::expect_true("r_squared" %in% names(r_squared_in_time_table))
  testthat::expect_true(all(r_squared_in_time_table$epoch >= 0.0))
  testthat::expect_true(all(r_squared_in_time_table$r_squared >= 0.0))
  testthat::expect_true(all(r_squared_in_time_table$r_squared <= 1.0))
  invisible(r_squared_in_time_table)
}
