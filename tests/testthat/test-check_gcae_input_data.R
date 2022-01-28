test_that("use", {
  gcae_input_filenames <- create_gcae_input_files_1()
  gcae_input_data <- read_gcae_input_files(gcae_input_filenames)
  expect_silent(check_gcae_input_data(gcae_input_data))

  expect_error(check_gcae_input_data(gcae_input_data = "nonsense"))
  expect_error(check_gcae_input_data(gcae_input_data = list(x = "nonsense")))
})
