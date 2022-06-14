test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!plinkr::is_plink_installed()) return()

  gcae_input_filenames <- create_gcae_input_files_1(
    base_input_filename = file.path(
      get_gcaer_tempfilename(),
      "check_gcae_input_filenames"
    )
  )
  check_gcae_input_filenames(gcae_input_filenames)

  gcae_input_filenames_without_labels_filename <- gcae_input_filenames # nolint indeed a long variable name
  gcae_input_filenames_without_labels_filename$labels_filename <- NULL # nolint indeed a long variable name
  check_gcae_input_filenames(gcae_input_filenames_without_labels_filename)
})
