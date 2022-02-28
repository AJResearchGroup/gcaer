test_that("use", {
  if (!plinkr::is_plink_installed()) return()

  # Create the files
  gcae_input_filenames <- create_gcae_input_files_1(
    base_input_filename = file.path(
      get_gcaer_tempfilename(),
      "check_gcae_input_files"
    )
  )

  # Check the files
  check_gcae_input_files(gcae_input_filenames)

  # Clean up the files
  file.remove(as.character(unlist(gcae_input_filenames)))
})
