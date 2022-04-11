test_that("use", {
  train_times_filename <- get_gcaer_tempfilename(fileext = ".csv")
  readr::write_csv(
    x = create_test_train_times_table(),
    file = train_times_filename
  )
  expect_true(file.exists(train_times_filename))

  png_filename <- get_gcaer_tempfilename(fileext = ".png")
  plot_train_times_from_file(
    train_times_filename = train_times_filename,
    png_filename = png_filename
  )
  expect_true(file.exists(png_filename))
  file.remove(train_times_filename)
  file.remove(png_filename)
})
