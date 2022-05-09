test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!plinkr::is_plink_installed()) return()

  gcae_input_filenames <- create_gcae_input_files_1(
    base_input_filename = file.path(
      get_gcaer_tempfilename(),
      "read_gcae_input_files"
    )
  )
  gcae_input_data <- read_gcae_input_files(gcae_input_filenames)
  check_gcae_input_data(gcae_input_data)

  file.remove(as.character(unlist(gcae_input_filenames)))
})

test_that("error message if file is absent", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!plinkr::is_plink_installed()) return()

  gcae_input_filenames <- create_test_gcae_input_filenames()
  gcae_input_filenames$labels_filename <- "does_not_exists.csv"
  check_gcae_input_filenames(gcae_input_filenames)
  expect_error(
    read_gcae_input_files(
      gcae_input_filenames
    ),
    "does_not_exists.csv"
  )
})
