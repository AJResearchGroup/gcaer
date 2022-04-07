#' Read a `train_times_table` from file
#'
#' Read a `train_times_table` from file
#' @inheritParams default_params_doc
#' @return the `train_times_table`,
#' as checked by \link{check_train_times_table}
#' @author Richèl J.C. Bilderbeek
#' @export
read_train_times_file <- function(train_times_filename) {
  gcaer::check_csv_filename(train_times_filename)
  testthat::expect_true(file.exists(train_times_filename))
  train_times_table <- readr::read_csv(
    train_times_filename,
    col_types = readr::cols(
      epoch = readr::col_double(),
      train_time_sec = readr::col_double()
    )
  )
  gcaer::check_train_times_table(train_times_table)
  train_times_table
}
