test_that("use", {
  # Create the files
  gcae_input_filenames <- create_gcae_input_files_1(
    base_input_filename = gcaer::get_gcaer_tempfilename()
  )

  # Check the files
  check_gcae_input_files(gcae_input_filenames)

  # Clean up the files
  file.remove(as.character(unlist(gcae_input_filenames)))
})
