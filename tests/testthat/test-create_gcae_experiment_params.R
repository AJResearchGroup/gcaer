test_that("use", {
  gcae_experiment_params <- create_gcae_experiment_params(
    gcae_options = create_gcae_options(),
    gcae_setup = create_test_gcae_setup(),
    analyse_epochs = seq(1, 2, 3)
  )
  check_gcae_experiment_params(gcae_experiment_params)
})
