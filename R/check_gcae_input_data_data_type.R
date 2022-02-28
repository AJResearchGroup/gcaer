#' Check if the data type of `gcae_input_data` is valid
#'
#' Check if the data type of `gcae_input_data` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `gcae_input_data` is invalid.
#' @seealso
#' Related checking functions:
#'
#'  * Use \link{check_gcae_input_data} to check the in-memory GCAE input data
#'    extensively
#'  * Use \link{check_gcae_input_data_data_type} to check the
#'    data type of the in-memory GCAE input data
#'  * Use \link{check_gcae_input_files} to check the
#'    files to be used by GCAE as input,
#'    i.e. `GCAE` can run these
#'  * Use \link{check_gcae_input_filenames} to check the
#'    filenames (and not the files' content) to be GCAE input files
#'
#' Functions related to `gcae_input_data`:
#'
#'  * Use \link{summarise_gcae_input_data} to summarise the GCAE input data
#' @examples
#' if (plinkr::is_plink_installed()) {
#'   gcae_input_filenames <- create_gcae_input_files_1(
#'     base_input_filename = get_gcaer_tempfilename()
#'   )
#'   gcae_input_data <- read_gcae_input_files(gcae_input_filenames)
#'   check_gcae_input_data(gcae_input_data)
#'
#'   # Clean up
#'   file.remove(as.character(unlist(gcae_input_filenames)))
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
check_gcae_input_data_data_type <- function(gcae_input_data) { # nolint indeed a long function name
  testthat::expect_true(is.list(gcae_input_data))
  testthat::expect_true("bed_table" %in% names(gcae_input_data))
  testthat::expect_true("bim_table" %in% names(gcae_input_data))
  testthat::expect_true("fam_table" %in% names(gcae_input_data))
  testthat::expect_true("phe_table" %in% names(gcae_input_data))
  testthat::expect_true("labels_table" %in% names(gcae_input_data))
  plinkr::check_bed_table(gcae_input_data$bed_table)
  plinkr::check_bim_table(gcae_input_data$bim_table)
  plinkr::check_fam_table(gcae_input_data$fam_table)
  plinkr::check_phe_table(gcae_input_data$phe_table)
  gcaer::check_labels_table(gcae_input_data$labels_table)
}
