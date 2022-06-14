#' Determine if the `gcae_experiment_params` is indeed
#' a `gcae_experiment_params`
#' @inheritParams default_params_doc
#' @return \link{TRUE} if the `gcae_experiment_params` is indeed
#' a `gcae_experiment_params`
#' @examples
#' # TRUE
#' is_gcae_experiment_params(create_test_gcae_experiment_params())
#'
#' # FALSE
#' is_gcae_experiment_params(gcae_experiment_params = "nonsense")
#' is_gcae_experiment_params("nonsense", verbose = TRUE)
#' @author Richèl J.C. Bilderbeek
#' @export
is_gcae_experiment_params <- function(
  gcae_experiment_params,
  verbose = FALSE
) {
  plinkr::check_verbose(verbose)
  result <- FALSE
  tryCatch({
    gcaer::check_gcae_experiment_params(
      gcae_experiment_params = gcae_experiment_params
    )
    result <- TRUE
  }, error = function(e) {
      if (verbose) message(e$message)
    }
  )
  result
}
