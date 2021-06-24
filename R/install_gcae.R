#' Install a specific version of GCAE
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
install_gcae <- function(
  gcae_options = create_gcae_options()
) {
  gcaer::check_gcae_options(gcae_options)
  testthat::expect_false(
    gcaer::is_gcae_installed(gcae_options)
  )

  gcae_subfolder <- file.path(
    gcae_options$gcae_folder, "gcae_v",
    stringr::str_replace_all(gcae_options$gcae_version, "\\.", "_")
  )

  if (!dir.exists(gcae_subfolder)) {
    # Clone repo
    gert::git_clone(
      url = "https://github.com/kausmees/GenoCAE",
      path = gcae_subfolder,
      branch = "master",
      verbose = FALSE
    )
  }
  testthat::expect_true(dir.exists(gcae_subfolder))
  testthat::expect_true(
    gcaer::is_gcae_installed(gcae_options)
  )
}
