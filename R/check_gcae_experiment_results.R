#' Check if the `gcae_experiment_results` is valid.
#'
#' Check if the `gcae_experiment_results` is valid.
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return nothing
#' @author Richèl J.C. Bilderbeek
#' @export
check_gcae_experiment_results <- function(gcae_experiment_results) {
  testthat::expect_true(is.list(gcae_experiment_results))
  testthat::expect_true(
    "score_per_pop_table" %in% names(gcae_experiment_results)
  )
  testthat::expect_true(
    "scores_table" %in% names(gcae_experiment_results)
  )
  testthat::expect_true(
    "genotype_concordances_table" %in% names(gcae_experiment_results)
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
  if (nrow(gcae_experiment_results$score_per_pop_table) > 0) {
    gcaer::check_score_per_pop_table(
      gcae_experiment_results$score_per_pop_table
    )
  }
  if (nrow(gcae_experiment_results$scores_table) > 0) {
    gcaer::check_scores_table(
      gcae_experiment_results$scores_table
    )
  }
  gcaer::check_genotype_concordances_table(
    gcae_experiment_results$genotype_concordances_table
  )
  if ("phenotype_predictions_table" %in% names(gcae_experiment_results) &&
      tibble::is_tibble(gcae_experiment_results$phenotype_predictions_table)) {
    gcaer::check_phenotype_predictions_table(
      gcae_experiment_results$phenotype_predictions_table
    )
  }
  if ("nmse_in_time_table" %in% names(gcae_experiment_results) &&
      tibble::is_tibble(gcae_experiment_results$nmse_in_time_table)) {
    gcaer::check_nmse_in_time_table(
      gcae_experiment_results$nmse_in_time_table
    )
  }

  gcaer::check_train_times_table(
    gcae_experiment_results$train_times_table
  )
  gcaer::check_losses_from_train_t_table(
    gcae_experiment_results$losses_from_train_t_table
  )
  gcaer::check_losses_from_train_v_table(
    gcae_experiment_results$losses_from_train_v_table
  )
  invisible(gcae_experiment_results)
}
