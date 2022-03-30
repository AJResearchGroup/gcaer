#' Save a `gcae_options` to file
#' @inheritParams default_params_doc
#' @return Nothing
#' @seealso
#' Use \link{read_gcae_options_file} to read a `gcae_options` from file
#' @examples
#' # Create a gcae_options
#' gcae_options <- create_gcae_options()
#'
#' # Use a temporary file
#' gcae_options_filename <- get_gcaer_tempfilename(fileext = ".csv")
#'
#' # Save gcae_options to temporary file
#' save_gcae_options(
#'   gcae_options = gcae_options,
#'   gcae_options_filename = gcae_options_filename
#' )
#'
#' # Load the temporary file to get a copy of the gcae_options
#' gcae_options_again <- read_gcae_options_file(gcae_options_filename)
#'
#' # Cleanup
#' file.remove(gcae_options_filename)
#' @author Richèl J.C. Bilderbeek
#' @export
save_gcae_options <- function(
  gcae_options = gcae_options,
  gcae_options_filename = gcae_options_filename
) {
  gcaer::check_gcae_options(gcae_options)
  gcaer::check_gcae_options_filename(gcae_options_filename)
  t <- tibble::tibble(
    parameter = names(gcae_options),
    value = as.character(unlist(gcae_options))
  )
  dir.create(
    dirname(gcae_options_filename),
    recursive = TRUE,
    showWarnings = FALSE
  )
  readr::write_csv(x = t, file = gcae_options_filename)
  invisible(gcae_options)
}
