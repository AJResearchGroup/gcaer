test_that("use", {
  png_filename <- get_gcaer_tempfilename(fileext = ".png")
  create_score_per_pop_through_time_png(
    score_per_pop_table = create_test_score_per_pop_table(),
    png_filename = png_filename
  )
  expect_true(file.exists(png_filename))
  file.remove(png_filename)
})
