#' Install a specific version of GCAE
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
  testthat::expect_false(
    gcaer::is_gcae_installed(gcae_options)
  )
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
