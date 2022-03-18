#' Resize the `gcae_input_data` to only contain the shared individuals.
#'
#' Resize the `gcae_input_data` to only contain the shared individuals.
#' @inheritParams default_params_doc
#' @return the `gcae_input_data` with only shared individuals
#' @seealso
#' Related resize functions:
#'
#'  * Use \link{resize_to_shared_individuals_from_data}
#'    to resize the data in in-memory data
#'  * Use \link{resize_to_shared_individuals_from_files}
#'    to resize the data in files
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
resize_to_shared_individuals_from_files <- function(# nolint indeed a long function name
  gcae_input_filenames,
  verbose = FALSE
) { # nolint indeed a long function name
  gcaer::check_gcae_input_filenames(gcae_input_filenames)

  gcae_input_data <- gcaer::resize_to_shared_individuals_from_data(
    gcae_input_data = gcaer::read_gcae_input_files(gcae_input_filenames),
    verbose = verbose
  )

  gcaer::save_gcae_input_data(
    gcae_input_data = gcae_input_data,
    gcae_input_filenames = gcae_input_filenames
  )
}
