#' Save a `GCAE` labels file
#' @inheritParams default_params_doc
#' @return the `labels_table` invisibly
#' @note `GCAE` does not save this data with column names
#' @seealso use \link{read_labels_file} to load a `labels_table`
#' from file
#' @examples
#' # Get a labels table
#' labels_filename <- get_gcaer_filename("gcae_input_files_1_labels.csv")
#' labels_table <- read_labels_file(labels_filename)
#'
#' # Save it
#' labels_filename <- get_gcaer_tempfilename(fileext = ".csv")
#' save_labels_file(
#'   labels_table = labels_table,
#'   labels_filename = labels_filename
#' )
#'
#' # Clean up
#' file.remove(labels_filename)
#' @author Richèl J.C. Bilderbeek
#' @export
save_labels_file <- function(
  labels_table,
  labels_filename
) {
  readr::write_csv(
    x = labels_table,
    file = labels_filename,
    col_names = FALSE
  )
  invisible(labels_table)
}
