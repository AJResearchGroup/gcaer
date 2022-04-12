test_that("use, example file", {
  model_filename <- get_gcaer_filename("M0.json")
  expect_true(file.exists(model_filename))
  model <- read_model_file(model_filename)
  plot_model(model = model)
})

test_that("use, GCAE file", {
  if (!is_gcae_script_fixed()) return()
  model_filename <- get_gcae_model_filename("M1")
  expect_true(file.exists(model_filename))
  model <- read_model_file(model_filename)
  plot_model(model = model)
})
