test_that("M0, from model", {
  model_filename <- get_gcaer_filename("M0.json")
  model <- read_model_file(model_filename)
  n_neurons <- get_n_neurons_in_latent_layer(model)
  expect_equal(2, n_neurons)
})

test_that("M0, from gcae_experiment_params", {
  gcae_experiment_params <- create_test_gcae_experiment_params()
  expect_equal("M0", gcae_experiment_params$gcae_setup$model_id)
  n_neurons <- get_n_neurons_in_latent_layer(gcae_experiment_params)
  expect_equal(2, n_neurons)
})
