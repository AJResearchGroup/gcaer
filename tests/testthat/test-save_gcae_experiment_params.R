test_that("use", {
  if (!is_gcae_installed()) return()

  gcae_experiment_params <- create_test_gcae_experiment_params()
  gcae_experiment_params_filename <- get_gcaer_tempfilename(  # nolint indeed a long variable name
    pattern = "experiment",
    fileext = ".csv"
  )
  save_gcae_experiment_params(
    gcae_experiment_params = gcae_experiment_params,
    gcae_experiment_params_filename = gcae_experiment_params_filename
  )
  expect_true(file.exists(gcae_experiment_params_filename))
})
