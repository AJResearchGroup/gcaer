#' Check if the `gcae_experiment_results` is valid.
#'
#' Check if the `gcae_experiment_results` is valid.
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return nothing
#' @author Richèl J.C. Bilderbeek
#' @export
check_gcae_experiment_results <- function(gcae_experiment_results) {
  names(gcae_experiment_results)
  testthat::expect_true(is.list(gcae_experiment_results))
  testthat::expect_true(
    "scores_per_pops_table" %in% names(gcae_experiment_results)
  )
  testthat::expect_true(
    "scores_table" %in% names(gcae_experiment_results)
  )
  testthat::expect_true(
    "train_times_table" %in% names(gcae_experiment_results)
  )
  testthat::expect_true(
    "losses_from_train_t_table" %in% names(gcae_experiment_results)
  )
  testthat::expect_true(
    "losses_from_train_v_table" %in% names(gcae_experiment_results)
  )

  invisible(gcae_experiment_results)
}
