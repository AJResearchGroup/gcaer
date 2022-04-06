#' Check if the `nmse_in_time_table` is valid
#'
#' Check if the `nmse_in_time_table` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing.
#' Will \link{stop} if `nmse_in_time_table` is invalid.
#' @examples
#' nmse_in_time_table <- create_test_nmse_in_time_table()
#' check_nmse_in_time_table(nmse_in_time_table)
#' @author Richèl J.C. Bilderbeek
#' @export
check_nmse_in_time_table <- function(nmse_in_time_table) { # nolint indeed a long function name
  testthat::expect_true(tibble::is_tibble(nmse_in_time_table))
  testthat::expect_true("epoch" %in% names(nmse_in_time_table))
  testthat::expect_true("nmse" %in% names(nmse_in_time_table))
  invisible(nmse_in_time_table)
}
