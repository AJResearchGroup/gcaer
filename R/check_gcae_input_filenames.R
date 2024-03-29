#' Check if the GenoCAE input filenames \link{list} is valid.
#'
#' Check if the GenoCAE input filenames \link{list} is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing.
#' Will \link{stop} if the GenoCAE input filenames \link{list} is invalid.
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
#' Functions related to `gcae_input_filenames`:
#'
#'  * Use \link{summarise_gcae_input_files} to summarise the data
#'    in the `GCAE` input files
#' @examples
#' if (plinkr::is_plink_installed()) {
#'   # Create the files
#'   gcae_input_filenames <- create_gcae_input_files_1(
#'     base_input_filename = get_gcaer_tempfilename()
#'   )
#'   check_gcae_input_filenames(gcae_input_filenames)
#'
#'   # Clean up
#'   file.remove(as.character(unlist(gcae_input_filenames)))
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
check_gcae_input_filenames <- function(gcae_input_filenames) {
  testthat::expect_true(is.list(gcae_input_filenames))
  testthat::expect_true("bed_filename" %in% names(gcae_input_filenames))
  testthat::expect_true("bim_filename" %in% names(gcae_input_filenames))
  testthat::expect_true("fam_filename" %in% names(gcae_input_filenames))
  testthat::expect_true("phe_filename" %in% names(gcae_input_filenames))
  plinkr::check_base_input_filename(gcae_input_filenames$bed_filename)
  plinkr::check_base_input_filename(gcae_input_filenames$bim_filename)
  plinkr::check_base_input_filename(gcae_input_filenames$fam_filename)
  plinkr::check_base_input_filename(gcae_input_filenames$phe_filename)

  # labels_filename can be an empty string
  if ("labels_filename" %in% names(gcae_input_filenames)) {
    testthat::expect_equal(1, length(gcae_input_filenames$labels_filename))
    testthat::expect_true(is.character(gcae_input_filenames$labels_filename))
  }
}
