#' Read a `losses_from_train_v_table` from file
#'
#' Read a `losses_from_train_v_table` from file
#' @inheritParams default_params_doc
#' @return the `losses_from_train_v_table`,
#' as checked by \link{check_losses_from_train_v_table}
#' @author Richèl J.C. Bilderbeek
#' @export
read_losses_from_train_v_file <- function(losses_from_train_v_filename) {
  gcaer::check_csv_filename(losses_from_train_v_filename)
  testthat::expect_true(file.exists(losses_from_train_v_filename))
  losses_from_train_v_table <- readr::read_csv(
    losses_from_train_v_filename,
    col_types = readr::cols(
      epoch = readr::col_double(),
      losses_from_train_v = readr::col_double()
    )
  )
  gcaer::check_losses_from_train_v_table(losses_from_train_v_table)
  losses_from_train_v_table
}
