#' Create a `gcae_input_data`.
#'
#' Create a `gcae_input_data`
#' @inheritParams default_params_doc
#' @return a `gcae_input_data`
#' @seealso use \link{create_test_gcae_input_data} to obtain
#' a `gcae_input_data` to be used in testing
#' @examples
#' gcae_input_data <- create_test_gcae_input_data()
#' check_gcae_input_data(gcae_input_data)
#' @author Richèl J.C. Bilderbeek
#' @export
create_gcae_input_data <- function(
  gcae_input_filenames,
  verbose = FALSE
) {
  gcaer::check_gcae_input_filenames(gcae_input_filenames)
  gcaer::read_gcae_input_files(
    gcae_input_filenames = gcae_input_filenames,
    verbose = verbose
  )
}
