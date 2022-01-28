test_that("use", {
  labels_filename <- get_gcaer_filename("gcae_input_files_1_labels.csv")
  t <- read_labels_file(labels_filename)
  expect_equal(ncol(t), 2)
  expect_equal(nrow(t), 3)
})
