test_that("use", {
  model_filenames <- get_gcae_model_filenames()
  for (model_filename in model_filenames) {
    expect_silent(check_model_filename(model_filename))
    expect_silent(read_model_file(model_filename))
  }
})
