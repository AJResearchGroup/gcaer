#' Determine if `GCAE`'s repo is cloned
#'
#' Determine if `GCAE`'s repo is cloned
#' @inheritParams default_params_doc
#' @return `TRUE` if `GCAE`'s repo is cloned
#' @examples
#' is_gcae_repo_cloned()
#' @author Richèl J.C. Bilderbeek
#' @export
is_gcae_repo_cloned <- function(
  gcae_options = create_gcae_options(),
  verbose = FALSE
) {
  gcaer::check_gcae_options(gcae_options = gcae_options)
  plinkr::check_verbose(verbose = verbose)

  result <- FALSE
  tryCatch({
    gcaer::check_gcae_repo_is_cloned(gcae_options = gcae_options)
    result <- TRUE
  },
  error = function(e) {
    if (verbose) {
      message(e$message)
    }
  }
  )
  testthat::expect_equal(length(result), 1)
  result
}
