#' Install a specific version of GCAE
#'
#' Install a specific version of GCAE.
#'
#'  1. Clone the GCAE repo, see \link{clone_gcae_repo}
#'  2. Install the needed Python packages, see \link{install_gcae_requirements}
#'  3. Fix the GCAE script, see \link{fix_gcae_script}
#'
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
install_gcae <- function(
  gcae_options = create_gcae_options(),
  github_repo_url = get_default_github_repo_url(),
  github_repo_branch_name = get_default_github_repo_branch_name(),
  verbose = FALSE
) {
  gcaer::check_gcae_options(gcae_options)
  if (gcaer::is_gcae_installed(gcae_options)) {
    stop(
      "Cannot install GCAE when it is already installed. \n",
      "GCAE is already installed in 'gcae_options$gcae_folder': ",
        gcae_options$gcae_folder, " \n",
      "for 'gcae_options$gcae_version': ",
      gcae_options$gcae_version, " \n",
      "Tip 1: probably this is not a problem: GCAE is already installed! \n",
      "Tip 2: use 'gcaer::is_gcae_installed' ",
      "to determine if GCAE is already installed \n"
    )
  }
  if (verbose) {
    message("1. Clone the GCAE repo")
  }
  if (!gcaer::has_cloned_gcae_repo(gcae_options = gcae_options)) {
    gcaer::clone_gcae_repo(
      gcae_options = gcae_options,
      verbose = verbose
    )
  }
  gcaer::check_gcae_repo_is_cloned(gcae_options = gcae_options)

  if (verbose) {
    message("2. Install the needed Python packages")
  }
  gcaer::install_gcae_requirements(
    gcae_options = gcae_options,
    verbose = verbose
  )
  gcaer::check_gcae_python_packages_are_installed(gcae_options = gcae_options)

  # 3. Fix the GCAE script
  if (verbose) {
    message("Fix the GCAE script")
  }
  gcaer::fix_gcae_script(gcae_options = gcae_options)
  gcaer::check_gcae_script_is_fixed(gcae_options = gcae_options)

  if (verbose) {
    message("Extra check for now")
  }
  gcaer::check_gcae_is_installed(gcae_options = gcae_options)
}
