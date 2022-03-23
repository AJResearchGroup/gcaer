test_that("use", {
  model_filename <- get_gcae_model_filename("M1")
  model <- read_model_file(model_filename)

  expect_equal(2, get_n_neurons_in_latent_layer(model))

  model_1 <- set_n_neurons_in_latent_layer(model = model, n_neurons = 1)
  expect_equal(1, get_n_neurons_in_latent_layer(model_1))

  model_2 <- set_n_neurons_in_latent_layer(model = model, n_neurons = 2)
  expect_equal(2, get_n_neurons_in_latent_layer(model_2))

  model_3 <- set_n_neurons_in_latent_layer(model = model, n_neurons = 3)
  expect_equal(3, get_n_neurons_in_latent_layer(model_3))
})