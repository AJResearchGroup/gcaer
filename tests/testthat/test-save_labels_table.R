test_that("save and read must result in same table", {
  labels_table_before <- read_labels_file(
    labels_filename = get_gcaer_filename("gcae_input_files_1_labels.csv")
  )
  labels_filename <- gcaer::get_gcaer_tempfilename(fileext = ".csv")
  save_labels_table(
    labels_table = labels_table_before,
    labels_filename = labels_filename
  )
  labels_table_after <- read_labels_file(
    labels_filename = labels_filename
  )
  expect_equal(labels_table_before, labels_table_after)
  file.remove(labels_filename)
})
