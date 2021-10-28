#' Determines if the GCAE repo has been cloned already
#' @inheritParams default_params_doc
#' @return TRUE if the GCAE repo has been cloned already
#' @seealso use \link{clone_gcae_repo} to clone the GCAE repo
#' @examples
#' has_cloned_gcae_repo()
#' @author Richèl J.C. Bilderbeek
#' @export
has_cloned_gcae_repo <- function(
  gcae_options = create_gcae_options()
) {
  gcaer::check_gcae_options(gcae_options)
  gcae_subfolder <- gcaer::get_gcae_subfolder(gcae_options = gcae_options)
  dir.exists(gcae_subfolder)
}
