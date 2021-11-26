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
  gcae_subfolder <- gcaer::get_gcae_subfolder(gcae_options = gcae_options)
  if (!dir.exists(gcae_subfolder)) {
    stop(
      "GCAE repository is not cloned: GCAE subfolder not found \n",
      "'gcae_subfolder': ", gcae_subfolder, " \n",
      paste0(
        gcaer::gcae_options_to_str(gcae_options = gcae_options), collapse = "\n"
      ), " \n",
      "Tip: run 'gcaer::clone_gcae_repo()'"
    )
  }
}
