test_that("use", {
  train_filenames <- c(
    get_gcaer_filename("train_times.csv"),
    get_gcaer_filename("losses_from_train_t.csv"),
    get_gcaer_filename("losses_from_train_v.csv")
  )
  train_results <- parse_train_filenames(train_filenames)
})
