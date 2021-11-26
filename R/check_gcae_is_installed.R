#' Check if GCAE is installed
#'
#' Check if GCAE is installed. Will \link{stop} if not
#'
#' GCAE is installed, if:
#'
#'  * The GCAE repo is cloned, see \link{check_gcae_repo_is_cloned}
#'  * The needed Python packages, see \link{check_gcae_python_packages_are_installed}
#'  * Fix the GCAE script, see \link{check_gcae_script_is_fixed}
#'
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if GCAE is not installed.
#' @author Richèl J.C. Bilderbeek
#' @export
check_gcae_is_installed <- function(
  gcae_options = create_gcae_options()
) {
  gcaer::check_gcae_options(gcae_options)
  gcaer::check_gcae_repo_is_cloned(gcae_options = gcae_options)
  gcaer::check_gcae_python_packages_are_installed(gcae_options = gcae_options)
  gcaer::check_gcae_script_is_fixed(gcae_options = gcae_options)
}
