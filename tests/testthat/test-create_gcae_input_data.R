test_that("use", {
  gcae_input_filenames <- create_test_gcae_input_filenames()
  gcae_input_data <- create_gcae_input_data(gcae_input_filenames)
  expect_silent(check_gcae_input_data(gcae_input_data))
})
