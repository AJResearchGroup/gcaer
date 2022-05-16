#' Determine if `GCAE` is installed
#' @inheritParams default_params_doc
#' @return `TRUE` if `GCAE` is installed
#' @note this is a slow function.
#'
#' A quicker, yet less accurate way to determine if `GCAE` is
#' installed, is \link{has_cloned_gcae_repo}
#' @examples
#' # Tip: 'has_cloned_gcae_repo' is a a quicker, yet less accurate way
#' # to determine if `GCAE` is installed
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
