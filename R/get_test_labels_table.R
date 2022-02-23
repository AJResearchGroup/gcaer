#' Get a `labels_table` for use in testing.
#'
#' Get a `labels_table` (as can be checked by \link{check_labels_table})
#' for use in testing.
#' @return a `labels_table`
#' @examples
#' get_test_labels_table()
#' @author Richèl J.C. Bilderbeek
#' @export
get_test_labels_table <- function() {
  gcaer::read_labels_file(
    labels_filename = gcaer::get_gcaer_filename(
      "gcae_input_files_1_labels.csv"
    )
  )
}
