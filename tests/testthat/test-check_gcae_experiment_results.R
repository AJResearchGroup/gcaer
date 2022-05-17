test_that("use", {
  gcae_experiment_results <- create_test_gcae_experiment_results()
  expect_silent(check_gcae_experiment_results(gcae_experiment_results))
  # No phenotype results
  gcae_experiment_results$phenotype_predictions_table <- NULL
  expect_silent(check_gcae_experiment_results(gcae_experiment_results))
  gcae_experiment_results$nmse_in_time_table <- NULL
  expect_silent(check_gcae_experiment_results(gcae_experiment_results))
})
