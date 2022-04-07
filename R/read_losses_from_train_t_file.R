#' Read a `losses_from_train_t_table` from file
#'
#' Read a `losses_from_train_t_table` from file
#' @inheritParams default_params_doc
#' @return the `losses_from_train_t_table`,
#' as checked by \link{check_losses_from_train_t_table}
#' @author Richèl J.C. Bilderbeek
#' @export
read_losses_from_train_t_file <- function(losses_from_train_t_filename) {
  gcaer::check_csv_filename(losses_from_train_t_filename)
  testthat::expect_true(file.exists(losses_from_train_t_filename))
  losses_from_train_t_table <- readr::read_csv(
    losses_from_train_t_filename,
    col_types = readr::cols(
      epoch = readr::col_double(),
      losses_from_train_t = readr::col_double()
    )
  )
  gcaer::check_losses_from_train_t_table(losses_from_train_t_table)
  losses_from_train_t_table
}
