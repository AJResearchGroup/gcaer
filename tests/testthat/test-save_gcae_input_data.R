test_that("use", {
  base_filename <- file.path(
    gcaer::get_gcaer_tempfilename(),
    "save_gcae_input_data"
  )
  gcae_input_filenames <- create_gcae_input_filenames(
    bed_filename = paste0(base_filename, ".bed"),
    bim_filename = paste0(base_filename, ".bim"),
    fam_filename = paste0(base_filename, ".fam"),
    phe_filename = paste0(base_filename, ".phe"),
    labels_filename = paste0(base_filename, "_labels.csv")
  )
  gcaer::check_gcae_input_filenames(gcae_input_filenames)
  gcae_input_data <- create_test_gcae_input_data()

  # select the first 2
  gcae_input_data$labels_table <- gcae_input_data$labels_table[seq(1, 2), ]
  gcae_input_data_before <- resize_to_shared_individuals_from_data(
    gcae_input_data
  )
  summary_before <- summarise_gcae_input_data(gcae_input_data_before)

  save_gcae_input_data(
    gcae_input_data = gcae_input_data_before,
    gcae_input_filenames = gcae_input_filenames
  )

  gcae_input_data_after <- read_gcae_input_files(gcae_input_filenames)
  summary_after <- summarise_gcae_input_data(gcae_input_data_after)

  expect_equal(as.integer(summary_before), as.integer(summary_after))
})
