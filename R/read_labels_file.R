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
read_labels_file <- function(labels_filename) {
  if (!file.exists(labels_filename)) {
    stop(
      "'read_labels_file' cannot find file at 'labels_filename'. \n",
      "labels_filename: ", labels_filename
    )
  }
  plinkr::check_base_input_filename(labels_filename)
  testthat::expect_true(stringr::str_detect(labels_filename, "\\.csv$"))
  label_table <- readr::read_csv(
    labels_filename,
    col_names = FALSE, # GenoCAE does not use column names
    show_col_types = FALSE
  )
  # Add labels, as these are easier to work with
  names(label_table) <- c("population", "super_population")
  label_table
}
