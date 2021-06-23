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

  # Do it

  testthat::expect_true(
    gcaer::is_gcae_installed(gcae_options)
  )
}
