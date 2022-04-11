test_that("use", {
  score_per_pop_filename <- get_gcaer_tempfilename(fileext = ".csv")
  readr::write_csv(
    x = create_test_score_per_pop_table(),
    file = score_per_pop_filename
  )
  expect_true(file.exists(score_per_pop_filename))

  png_filename <- get_gcaer_tempfilename(fileext = ".png")
  plot_score_per_pop_from_file(
    score_per_pop_filename = score_per_pop_filename,
    png_filename = png_filename
  )
  expect_true(file.exists(png_filename))
  file.remove(score_per_pop_filename)
  file.remove(png_filename)
})
