#' Install a specific version of GCAE
#'
#' Install a specific version of GCAE.
#'
#'  * Clone the GCAE repo, see \link{clone_gcae_repo}
#'  * Install the needed Python packages, see \link{install_gcae_requirements}
#'  * Fix the GCAE script, see \link{fix_gcae_script}
#'
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
install_gcae <- function(
  gcae_options = create_gcae_options(),
  github_repo_url = "https://github.com/cnettel/GenoCAE",
  github_repo_branch_name = "Pheno",
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
  # Clone repo
  if (!gcaer::has_cloned_gcae_repo(gcae_options = gcae_options)) {
    gcaer::clone_gcae_repo(
      gcae_options = gcae_options,
      verbose = verbose
    )
  }
  # Install requirements
  gcaer::install_gcae_requirements(
    gcae_options = gcae_options,
    verbose = verbose
  )

  testthat::expect_true(
    gcaer::is_gcae_installed(gcae_options)
  )
}
