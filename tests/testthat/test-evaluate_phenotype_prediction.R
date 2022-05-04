test_that("abuse", {
  gcae_experiment_params <- create_test_gcae_experiment_params()
  dir.create(gcae_experiment_params$gcae_setup$trainedmodeldir)
  expect_error(
    evaluate_phenotype_prediction(
      gcae_experiment_params = gcae_experiment_params,
      epoch = 100
    ),
    "Must have exactly one phenotype file in 'trainedmodeldir'"
  )
})
