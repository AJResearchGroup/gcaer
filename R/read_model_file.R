#' Read a `GCAE` labels file
#' @inheritParams default_params_doc
#' @return a `labels_table`, as can be checked by \link{check_labels_table}
#' @note `GCAE` does not save this data with column names.
#' @seealso use \link{save_labels_table} to save a `labels_table`
#' @examples
#' labels_filename <- get_gcaer_filename("gcae_input_files_1_labels.csv")
#' read_labels_file(labels_filename)
#' @author Richèl J.C. Bilderbeek
#' @export
read_model_file <- function(model_filename) {
  testthat::expect_true(file.exists(model_filename))
  gcaer::check_model_filename(model_filename)
  jsonlite::fromJSON(
    readr::read_file(model_filename),
    simplifyVector = FALSE
  )
}
