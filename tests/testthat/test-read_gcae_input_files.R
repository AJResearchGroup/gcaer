test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!plinkr::is_plink_installed()) return()

  gcae_input_filenames <- create_gcae_input_files_1()
  gcae_input_data <- read_gcae_input_files(gcae_input_filenames)
  check_gcae_input_data(gcae_input_data)

  file.remove(as.character(unlist(gcae_input_filenames)))
})
