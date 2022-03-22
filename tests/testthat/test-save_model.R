test_that("use", {
  model_filename <- get_gcae_model_filename("M1")
  expect_true(file.exists(model_filename))
  model <- read_model_file(model_filename)
  n_neurons_before <- get_n_neurons_in_latent_layer(model)
  expect_equal(2, n_neurons_before)
  skip("WIP")
  new_model <- set_n_neurons_in_latent_layer(
    model = model,
    n_neurons = 1
  )
  n_neurons_after <- get_n_neurons_in_latent_layer(new_model)
  expect_equal(1, n_neurons_after)

  new_model_filename <- get_gcaer_tempfilename(
    pattern = "p314_",
    fileext = ".json"
  )
  save_model(
    model = new_model,
    model_filename = new_model_filename
  )

  new_model_again <- gcaer::read_model(new_model_filename)
  expect_identical(new_model_again, new_model)
})
