#' Get the version of GCAE
#' @inheritParams default_params_doc
#' @return the version of GCAE
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcae_version <- function(
  gcae_options = create_gcae_options()
) {
  gcaer::check_gcae_options(gcae_options)
  gcaer::check_gcae_is_installed(gcae_options)
  text <- gcaer::get_gcae_help_text(gcae_options)
  version_line <- stringr::str_subset(
    string = text,
    pattern = "GCAE.*(v[:digit:]+\\.[:digit:]+)"
  )
  testthat::expect_equal(1, length(version_line))
  version <- stringr::str_match(
    string = version_line,
    pattern = "GCAE.*(v[:digit:]+\\.[:graph:]+)"
  )[, 2]
  version
}
