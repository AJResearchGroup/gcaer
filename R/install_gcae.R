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

  gcae_subfolder <- gcaer::get_gcae_subfolder(gcae_options = gcae_options)

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

  gcaer::install_gcae_requirements(gcae_options = gcae_options)

  testthat::expect_true(
    gcaer::is_gcae_installed(gcae_options)
  )
}
