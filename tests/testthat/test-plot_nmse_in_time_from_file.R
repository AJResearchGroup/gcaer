test_that("use", {
  nmse_in_time_filename <- get_gcaer_tempfilename(fileext = ".csv")
  readr::write_csv(
    x = create_test_nmse_in_time_table(),
    file = nmse_in_time_filename
  )
  expect_true(file.exists(nmse_in_time_filename))

  png_filename <- get_gcaer_tempfilename(fileext = ".png")
  plot_nmse_in_time_from_file(
    nmse_in_time_filename = nmse_in_time_filename,
    png_filename = png_filename
  )
  expect_true(file.exists(png_filename))
  file.remove(nmse_in_time_filename)
  file.remove(png_filename)
})
