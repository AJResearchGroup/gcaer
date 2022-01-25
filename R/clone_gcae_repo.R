#' Clone the GCAE repo
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
clone_gcae_repo <- function(
  gcae_options = create_gcae_options(),
  github_repo_url = get_default_github_repo_url(),
  github_repo_branch_name = get_default_github_repo_branch_name(),
  verbose = FALSE
) {
  gcaer::check_gcae_options(gcae_options)
  if (gcaer::has_cloned_gcae_repo(gcae_options = gcae_options)) {
    stop(
      "GCAE repo already has been cloned at ",
      gcae_options$gcae_folder
    )
  }
  dir.create(gcae_options$gcae_folder, showWarnings = FALSE, recursive = TRUE)

  if (!dir.exists(gcae_options$gcae_folder)) {
    # Clone repo
    gert::git_clone(
      url = github_repo_url,
      path = gcae_options$gcae_folder,
      branch = github_repo_branch_name,
      verbose = verbose
    )
  }
  testthat::expect_true(dir.exists(gcae_options$gcae_folder))
}
