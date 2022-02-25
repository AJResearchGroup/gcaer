#' Resize the `gcae_input_data` to only contain the shared individuals.
#'
#' Resize the `gcae_input_data` to only contain the shared individuals.
#' @inheritParams default_params_doc
#' @return the `gcae_input_data` with only shared individuals
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
#' @examples
#' gcae_input_data <- create_test_gcae_input_data()
#'
#' # Show before
#' summarise_gcae_input_data(gcae_input_data)
#'
#' gcae_input_data <- resize_to_shared_individuals_from_data(gcae_input_data)
#'
#' # Show after
#' summarise_gcae_input_data(gcae_input_data)
#' @author Richèl J.C. Bilderbeek
#' @export
resize_to_shared_individuals_from_files <- function(gcae_input_filenames) { # nolint indeed a long function name
  gcaer::check_gcae_input_filenames(gcae_input_filenames)

  gcae_input_data <- read_gcae_input_files(gcae_input_filenames)

  resize_to_shared_individuals_from_data(gcae_input_data)

  gcaer::save_gcae_input_data(
    gcae_input_data = gcae_input_data,
    gcae_input_filenames = gcae_input_filenames
  )
}
