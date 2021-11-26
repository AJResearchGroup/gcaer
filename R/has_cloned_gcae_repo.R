#' Determines if the GCAE repo has been cloned already
#' @inheritParams default_params_doc
#' @return TRUE if the GCAE repo has been cloned already
#' @seealso use \link{clone_gcae_repo} to clone the GCAE repo
#' @examples
#' has_cloned_gcae_repo()
#' @author Richèl J.C. Bilderbeek
#' @export
has_cloned_gcae_repo <- function(
  gcae_options = create_gcae_options(),
  verbose = FALSE
) {
  gcaer::check_gcae_options(gcae_options = gcae_options)

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
