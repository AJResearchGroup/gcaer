test_that("M0", {
  model_filename <- get_gcae_model_filename("M0")
  model <- read_model_file(model_filename)
  n_neurons <- get_n_neurons_in_latent_layer(model)
  expect_equal(1, n_neurons)
})

test_that("M1", {
  model_filename <- get_gcae_model_filename("M1")
  model <- read_model_file(model_filename)
  n_neurons <- get_n_neurons_in_latent_layer(model)
  expect_equal(2, n_neurons)
})

test_that("M3d", {
  model_filename <- get_gcae_model_filename("M3d")
  model <- read_model_file(model_filename)
  n_neurons <- get_n_neurons_in_latent_layer(model)
  expect_equal(2, n_neurons)
})

test_that("M3e", {
  model_filename <- get_gcae_model_filename("M3e")
  model <- read_model_file(model_filename)
  n_neurons <- get_n_neurons_in_latent_layer(model)
  expect_equal(2, n_neurons)
})

test_that("M3f", {
  model_filename <- get_gcae_model_filename("M3f")
  model <- read_model_file(model_filename)
  n_neurons <- get_n_neurons_in_latent_layer(model)
  expect_equal(2, n_neurons)
})
