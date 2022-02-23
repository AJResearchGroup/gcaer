test_that("use", {
  gcae_input_filenames <- create_test_gcae_input_filenames()
  expect_silent(check_gcae_input_filenames(gcae_input_filenames))
})
