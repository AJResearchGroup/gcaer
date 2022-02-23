test_that("use", {
  gcae_input_filenames <- create_test_gcae_input_filenames()
  expect_message(summarise_gcae_input_files(gcae_input_filenames))
})
