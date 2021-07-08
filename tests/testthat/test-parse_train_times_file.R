test_that("use", {
  train_times_filename <- get_gcaer_filename("train_times.csv")
  t <- parse_train_times_file(train_times_filename)
  expect_equal(
    names(t),
    c("n", "t")
  )
})
