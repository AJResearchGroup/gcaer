test_that("use", {
  png_filename <- get_gcaer_tempfilename(fileext = ".png")
  create_losses_from_train_t_through_time_png(
    losses_from_train_t_table = create_test_losses_from_train_t_table(),
    png_filename = png_filename
  )
  expect_true(file.exists(png_filename))
  file.remove(png_filename)
})
