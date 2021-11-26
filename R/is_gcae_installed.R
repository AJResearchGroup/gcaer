#' Determine if `GCAE` is installed
#' @inheritParams default_params_doc
#' @return `TRUE` if `GCAE` is installed
#' @examples
#' is_gcae_installed()
#' @author Richèl J.C. Bilderbeek
#' @export
is_gcae_installed <- function(
  gcae_options = create_gcae_options(),
  verbose = FALSE
) {
  gcaer::check_gcae_options(gcae_options = gcae_options)
  plinkr::check_verbose(verbose = verbose)

  result <- FALSE
  tryCatch({
    gcaer::check_gcae_is_installed(gcae_options = gcae_options)
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
