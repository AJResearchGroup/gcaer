#' Clone the GCAE repo
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
clone_gcae_repo <- function(
  gcae_options = create_gcae_options(),
  github_repo_url = "https://github.com/cnettel/GenoCAE",
  github_repo_branch_name = "Pheno",
  verbose = FALSE
) {
  gcaer::check_gcae_options(gcae_options)
  gcae_subfolder <- gcaer::get_gcae_subfolder(gcae_options = gcae_options)
  if (gcaer::has_cloned_gcae_repo(gcae_options = gcae_options)) {
    stop("GCAE repo already has been cloned at ", gcae_subfolder)
  }
  dir.create(gcae_options$gcae_folder, showWarnings = FALSE, recursive = TRUE)

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
}
