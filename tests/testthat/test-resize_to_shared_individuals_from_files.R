test_that("use", {
  skip("WIP")
  gcae_input_filenames <- create_gcae_input_files_1(
    base_input_filename = get_gcaer_tempfilename()
  )
  before <- summarise_gcae_input_files(gcae_input_filenames)

  resize_to_shared_individuals_from_files(gcae_input_filenames)

  after <- summarise_gcae_input_files(gcae_input_filenames)

  expect_true(after != before)

  file.remove(as.character(unlist(gcae_input_filenames)))
})
