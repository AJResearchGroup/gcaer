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

  dir.create(gcae_options$gcae_folder, showWarnings = FALSE, recursive = TRUE)
  gcae_subfolder <- gcaer::get_gcae_subfolder(gcae_options = gcae_options)

  if (!dir.exists(gcae_subfolder)) {
    # Clone repo
    gert::git_clone(
      url = github_repo_url,
      path = gcae_subfolder,
      branch = github_repo_branch_name,
      verbose = verbose
    )
  }
  testthat::expect_true(dir.exists(gcae_subfolder))

  gcaer::install_gcae_requirements(gcae_options = gcae_options)

  testthat::expect_true(
    gcaer::is_gcae_installed(gcae_options)
  )
}
