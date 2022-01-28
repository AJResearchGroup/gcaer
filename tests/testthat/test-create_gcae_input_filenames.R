test_that("use", {
  gcae_input_filenames <- create_gcae_input_filenames(
    bed_filename = get_gcaer_filename("gcae_input_files_1.bed"),
    bim_filename = get_gcaer_filename("gcae_input_files_1.bim"),
    fam_filename = get_gcaer_filename("gcae_input_files_1.fam"),
    phe_filename = get_gcaer_filename("gcae_input_files_1.phe"),
    labels_filename = get_gcaer_filename("gcae_input_files_1_labels.csv")
  )
  expect_silent(check_gcae_input_filenames(gcae_input_filenames))
})
