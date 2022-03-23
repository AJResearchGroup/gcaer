test_that("use", {
  if (!is_gcae_installed()) return()
  model_filename <- get_gcae_model_filename("M1")
  expect_true(file.exists(model_filename))
  model <- read_model_file(model_filename)
  plot_model(model = model)
})
