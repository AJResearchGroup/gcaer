test_that("use", {
  r_squared_in_time_filename <- get_gcaer_tempfilename(fileext = ".csv")
  readr::write_csv(
    x = create_test_r_squared_in_time_table(),
    file = r_squared_in_time_filename
  )
  expect_true(file.exists(r_squared_in_time_filename))

  png_filename <- get_gcaer_tempfilename(fileext = ".png")
  plot_r_squared_in_time_from_file(
    r_squared_in_time_filename = r_squared_in_time_filename,
    png_filename = png_filename
  )
  expect_true(file.exists(png_filename))
  file.remove(r_squared_in_time_filename)
  file.remove(png_filename)
})
