test_that("example file", {
  model_filename <- get_gcaer_filename("M0.json")
  expect_true(file.exists(model_filename))
  model <- read_model_file(model_filename)
  n_neurons_before <- get_n_neurons_in_latent_layer(model)
  expect_equal(2, n_neurons_before)
  new_model <- set_n_neurons_in_latent_layer(
    model = model,
    n_neurons = 1
  )
  n_neurons_after <- get_n_neurons_in_latent_layer(new_model)
  expect_equal(1, n_neurons_after)
  new_model_filename <- get_gcaer_tempfilename(
    pattern = "M314_",
    fileext = ".json"
  )
  save_model(
    model = new_model,
    model_filename = new_model_filename
  )

  new_model_again <- read_model_file(new_model_filename)

  expect_true(is_equal_json(new_model, new_model_again))
  n_neurons_after_again <- get_n_neurons_in_latent_layer(new_model_again)
  expect_equal(n_neurons_after, n_neurons_after_again)
})

test_that("use", {
  if (!is_gcae_script_fixed()) return()

  model_filename <- get_gcae_model_filename("M1")
  expect_true(file.exists(model_filename))
  model <- read_model_file(model_filename)
  n_neurons_before <- get_n_neurons_in_latent_layer(model)
  expect_equal(2, n_neurons_before)
  new_model <- set_n_neurons_in_latent_layer(
    model = model,
    n_neurons = 1
  )
  n_neurons_after <- get_n_neurons_in_latent_layer(new_model)
  expect_equal(1, n_neurons_after)
  new_model_filename <- get_gcaer_tempfilename(
    pattern = "M314_",
    fileext = ".json"
  )
  save_model(
    model = new_model,
    model_filename = new_model_filename
  )

  new_model_again <- read_model_file(new_model_filename)

  expect_true(is_equal_json(new_model, new_model_again))
  n_neurons_after_again <- get_n_neurons_in_latent_layer(new_model_again)
  expect_equal(n_neurons_after, n_neurons_after_again)
})
