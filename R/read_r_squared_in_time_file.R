#' Read a `r_squared_in_time_table` from file
#'
#' Read a `r_squared_in_time_table` from file
#' @inheritParams default_params_doc
#' @return the `r_squared_in_time_table`,
#' as checked by \link{check_r_squared_in_time_table}
#' @author Richèl J.C. Bilderbeek
#' @export
read_r_squared_in_time_file <- function(r_squared_in_time_filename) {
  gcaer::check_csv_filename(r_squared_in_time_filename)
  testthat::expect_true(file.exists(r_squared_in_time_filename))
  r_squared_in_time_table <- readr::read_csv(
    r_squared_in_time_filename,
    col_types = readr::cols(
      epoch = readr::col_double(),
      r_squared = readr::col_double()
    )
  )
  gcaer::check_r_squared_in_time_table(r_squared_in_time_table)
  r_squared_in_time_table
}
