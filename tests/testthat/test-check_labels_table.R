test_that("use", {
  labels_filename <- get_gcaer_filename("gcae_input_files_1_labels.csv")
  labels_table <- read_labels_file(labels_filename = labels_filename)
  expect_silent(check_labels_table(labels_table))
})
