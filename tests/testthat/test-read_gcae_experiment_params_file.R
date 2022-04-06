test_that("use", {
  if (!is_gcae_installed()) return()

  gcae_experiment_params <- create_test_gcae_experiment_params()
  gcae_experiment_params_filename <- get_gcaer_tempfilename(fileext = ".csv") # nolint indeed a long variable name
  save_gcae_experiment_params(
    gcae_experiment_params = gcae_experiment_params,
    gcae_experiment_params_filename = gcae_experiment_params_filename
  )
  gcae_experiment_params_again <- read_gcae_experiment_params_file(
    gcae_experiment_params_filename
  )
  expect_identical(gcae_experiment_params, gcae_experiment_params_again)
  file.remove(gcae_experiment_params_filename)
})
