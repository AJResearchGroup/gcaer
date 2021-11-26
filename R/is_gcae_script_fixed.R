#' Clone the GCAE repo
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
is_gcae_script_fixed <- function(
  gcae_options = create_gcae_options(),
  verbose = FALSE
) {
  gcaer::check_gcae_options(gcae_options = gcae_options)

  result <- FALSE
  tryCatch({
    gcaer::check_gcae_script_is_fixed(gcae_options = gcae_options)
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
