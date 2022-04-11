test_that("use", {
  png_filename <- get_gcaer_tempfilename(fileext = ".png")
  create_scores_through_time_png(
    scores_table = create_test_scores_table(),
    png_filename = png_filename
  )
  expect_true(file.exists(png_filename))
  file.remove(png_filename)
})
