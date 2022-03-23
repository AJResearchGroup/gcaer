test_that("use", {
  if (!is_gcae_installed()) return()
  model_filename <- get_gcae_model_filename("M1")
  model <- read_model_file(model_filename)
})
