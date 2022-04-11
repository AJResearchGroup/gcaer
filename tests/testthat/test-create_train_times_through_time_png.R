test_that("use", {
  png_filename <- get_gcaer_tempfilename(fileext = ".png")
  create_train_times_through_time_png(
    train_times_table = create_test_train_times_table(),
    png_filename = png_filename
  )
  expect_true(file.exists(png_filename))
  file.remove(png_filename)
})
