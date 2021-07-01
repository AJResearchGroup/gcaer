#' Get the paths to all \code{GCAE} example files
#' @inheritParams default_params_doc
#' @return the path to all \code{GCAE} files
#' @examples
#' if (is_gcae_installed()) {
#'   get_gcae_example_filenames()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcae_example_filenames <- function(
  gcae_options = create_gcae_options()
) {
  gcae_subfolder <- gcaer::get_gcae_subfolder(gcae_options)
  example_folder <- file.path(gcae_subfolder, "example_tiny")
  testthat::expect_true(dir.exists(example_folder))
  list.files(example_folder, full.names = TRUE)
}