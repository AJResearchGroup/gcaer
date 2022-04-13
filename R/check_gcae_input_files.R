#' Check if the GenoCAE input files are valid.
#'
#' Check if the GenoCAE input files are valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing.
#' Will \link{stop} if the GenoCAE input files are invalid.
#' @seealso
#'  * Use \link{check_gcae_input_data} to check the in-memory GCAE input data
#'    extensively
#'  * Use \link{check_gcae_input_data_data_type} to check the
#'    data type of the in-memory GCAE input data
#'  * Use \link{check_gcae_input_files} to check the
#'    files to be used by GCAE as input,
#'    i.e. `GCAE` can run these
#'  * Use \link{check_gcae_input_filenames} to check the
#'    filenames (and not the files' content) to be GCAE input files
#'  * Use \link{summarise_gcae_input_data} to summarise the data
#' @examples
#' if (plinkr::is_plink_installed()) {
#'   # Create the files
#'   gcae_input_filenames <- create_gcae_input_files_1(
#'     base_input_filename = gcaer::get_gcaer_tempfilename()
#'   )
#'
#'   # Check the files
#'   check_gcae_input_files(gcae_input_filenames)
#'
#'   # Clean up the files
#'   file.remove(as.character(unlist(gcae_input_filenames)))
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
check_gcae_input_files <- function(
  gcae_input_filenames,
  verbose = FALSE
) {
  gcaer::check_gcae_input_filenames(gcae_input_filenames)
  gcae_input_data <- gcaer::read_gcae_input_files(
    gcae_input_filenames = gcae_input_filenames,
    verbose = verbose
  )
  gcaer::check_gcae_input_data(gcae_input_data = gcae_input_data)
}
