#' Get the path to a gcaer file
#' @inheritParams default_params_doc
#' @return the path to a gcaer file, if it exists.
#'   Will \link{stop} if the file does not exist
#' @examples
#' if (plinkr::is_on_ci()) {
#'
#'   if (has_cloned_gcae_repo()) { # is_gcae_installed is too slow
#'     get_gcae_example_filename("HumanOrigins249_tiny.fam")
#'   }
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcae_example_filename <- function(
  example_filename,
  gcae_options = create_gcae_options()
) {
  example_folder <- file.path(gcae_options$gcae_folder, "example_tiny")
  testthat::expect_true(dir.exists(example_folder))
  full_path <- file.path(example_folder, example_filename)
  if (!file.exists(full_path)) {
    stop(
      "'filename' must be the name of a file in the GCAE . \n",
      "Tip: use:\n",
      " \n",
      "gcaer::get_gcae_example_filenames() \n",
      " \n",
      "to get a list of all gcaer files \n"
    )
  }
  full_path
}
