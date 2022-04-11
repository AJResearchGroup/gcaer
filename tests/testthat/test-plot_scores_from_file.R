test_that("use", {
  scores_filename <- get_gcaer_tempfilename(fileext = ".csv")
  readr::write_csv(
    x = create_test_scores_table(),
    file = scores_filename
  )
  expect_true(file.exists(scores_filename))

  png_filename <- get_gcaer_tempfilename(fileext = ".png")
  plot_scores_from_file(
    scores_filename = scores_filename,
    png_filename = png_filename
  )
  expect_true(file.exists(png_filename))
  file.remove(scores_filename)
  file.remove(png_filename)
})
