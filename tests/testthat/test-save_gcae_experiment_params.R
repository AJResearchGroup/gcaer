test_that("use", {
  skip("WIP #15")
  if (!is_gcae_installed()) return()

  gcae_experiment_params_filename <- get_gcae_gcae_experiment_params_filename("M1")
  expect_true(file.exists(gcae_experiment_params_filename))
  gcae_experiment_params <- read_gcae_experiment_params_file(gcae_experiment_params_filename)
  n_neurons_before <- get_n_neurons_in_latent_layer(gcae_experiment_params)
  expect_equal(2, n_neurons_before)
  new_gcae_experiment_params <- set_n_neurons_in_latent_layer(
    gcae_experiment_params = gcae_experiment_params,
    n_neurons = 1
  )
  n_neurons_after <- get_n_neurons_in_latent_layer(new_gcae_experiment_params)
  expect_equal(1, n_neurons_after)
  new_gcae_experiment_params_filename <- get_gcaer_tempfilename(
    pattern = "M314_",
    fileext = ".json"
  )
  save_gcae_experiment_params(
    gcae_experiment_params = new_gcae_experiment_params,
    gcae_experiment_params_filename = new_gcae_experiment_params_filename
  )

  new_gcae_experiment_params_again <- read_gcae_experiment_params_file(new_gcae_experiment_params_filename)

  expect_true(is_equal_json(new_gcae_experiment_params, new_gcae_experiment_params_again))
  n_neurons_after_again <- get_n_neurons_in_latent_layer(new_gcae_experiment_params_again)
  expect_equal(n_neurons_after, n_neurons_after_again)
})
