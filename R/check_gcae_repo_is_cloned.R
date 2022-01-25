#' Check if the GCAE repo is cloned. Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return nothings
#' @seealso use \link{clone_gcae_repo} to clone the GCAE repo
#' @examples
#' if (has_cloned_gcae_repo()) {
#'   check_gcae_repo_is_cloned()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
check_gcae_repo_is_cloned <- function(
  gcae_options = create_gcae_options()
) {
  gcaer::check_gcae_options(gcae_options)
  if (!dir.exists(gcae_options$gcae_folder)) {
    stop(
      "GCAE repository is not cloned: GCAE folder not found \n",
      "'gcae_options$gcae_folder': ", gcae_options$gcae_folder, " \n",
      paste0(
        gcaer::gcae_options_to_str(gcae_options = gcae_options), collapse = "\n"
      ), " \n",
      "Tip: run 'gcaer::clone_gcae_repo()'"
    )
  }
  filename <- file.path(gcae_options$gcae_folder, "requirements.txt")
  if (!file.exists(filename)) {
    stop(
      "GCAE repository is not cloned: file not found \n",
      "Path to 'requirements.txt': ", filename, " \n",
      paste0(
        gcaer::gcae_options_to_str(gcae_options = gcae_options), collapse = "\n"
      ), " \n",
      "Tip: run 'gcaer::clone_gcae_repo()'"
    )
  }
}
