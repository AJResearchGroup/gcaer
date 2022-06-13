test_that("use", {
  png_filename <- get_gcaer_tempfilename(fileext = ".png")
  create_nmse_through_time_png(
    nmse_in_time_table = create_test_nmse_in_time_table(),
    png_filename = png_filename
  )
  expect_true(file.exists(png_filename))
  file.remove(png_filename)
})
