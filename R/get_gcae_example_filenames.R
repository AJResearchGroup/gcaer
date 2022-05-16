#' Get the paths to all \code{GCAE} example files
#' @inheritParams default_params_doc
#' @return the path to all \code{GCAE} files
#' @examples
#' if (plinkr::is_on_ci()) {
#'   if (has_cloned_gcae_repo()) { # is_gcae_installed is too slow
#'     get_gcae_example_filenames()
#'   }
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcae_example_filenames <- function(
  gcae_options = create_gcae_options()
) {
  example_folder <- file.path(gcae_options$gcae_folder, "example_tiny")
  testthat::expect_true(dir.exists(example_folder))
  list.files(example_folder, full.names = TRUE)
}
