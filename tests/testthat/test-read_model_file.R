test_that("use, example file", {
  model_filename <- get_gcaer_filename("M0.json")
  model <- read_model_file(model_filename)
})

test_that("use, GCAE file", {
  if (!is_gcae_installed()) return()
  model_filename <- get_gcae_model_filename("M1")
  model <- read_model_file(model_filename)
})
