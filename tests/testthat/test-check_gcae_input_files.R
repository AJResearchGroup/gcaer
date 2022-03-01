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

test_that("use files that are tested to work on Rackham", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!plinkr::is_plink_installed()) return()
  gcae_input_filenames <- list(
    bed_filename = get_gcaer_filename("sim_data_1.bed"),
    bim_filename = get_gcaer_filename("sim_data_1.bim"),
    fam_filename = get_gcaer_filename("sim_data_1.fam"),
    phe_filename = get_gcaer_filename("sim_data_1.phe"),
    labels_filename = get_gcaer_filename("sim_data_1_labels.csv")
  )
  check_gcae_input_files(gcae_input_filenames)
})
