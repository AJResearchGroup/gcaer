#' Save a `gcae_setup` to file
#' @inheritParams default_params_doc
#' @return Nothing
#' @seealso
#' Use \link{read_gcae_setup_file} to read a `gcae_setup` from file
#' @examples
#' # Create a gcae_setup
#' gcae_setup <- create_test_gcae_setup()
#'
#' # Use a temporary file
#' gcae_setup_filename <- get_gcaer_tempfilename(fileext = ".csv")
#'
#' # Save gcae_setup to temporary file
#' save_gcae_setup(
#'   gcae_setup = gcae_setup,
#'   gcae_setup_filename = gcae_setup_filename
#' )
#'
#' # Load the temporary file to get a copy of the gcae_setup
#' gcae_setup_again <- read_gcae_setup_file(gcae_setup_filename)
#'
#' # Cleanup
#' file.remove(gcae_setup_filename)
#' @author Richèl J.C. Bilderbeek
#' @export
save_gcae_setup <- function(
  gcae_setup = gcae_setup,
  gcae_setup_filename = gcae_setup_filename
) {
  gcaer::check_gcae_setup(gcae_setup)
  gcaer::check_gcae_setup_filename(gcae_setup_filename)
  t <- tibble::tibble(
    parameter = names(gcae_setup),
    value = as.character(unlist(gcae_setup))
  )
  readr::write_csv(x = t, file = gcae_setup_filename)
  invisible(gcae_setup)
}
