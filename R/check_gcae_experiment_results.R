#' Check if the `gcae_experiment_results` is valid.
#'
#' Check if the `gcae_experiment_results` is valid.
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return nothing
#' @examples
#' gcae_setup <- create_test_gcae_setup()
#' check_gcae_setup(gcae_setup)
#' @author Richèl J.C. Bilderbeek
#' @export
check_gcae_experiment_results <- function(gcae_experiment_results) {
  testthat::expect_true(is.list(gcae_experiment_results))
  testthat::expect_true(
    "dimensionality_reduction_scores" %in% names(gcae_experiment_results)
  )
  testthat::expect_true(
    "phenotype_prediction_scores" %in% names(gcae_experiment_results)
  )

  invisible(gcae_experiment_results)
}
