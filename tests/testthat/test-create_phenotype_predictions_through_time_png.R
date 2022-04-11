test_that("use", {
  png_filename <- get_gcaer_tempfilename(fileext = ".png")
  create_phenotype_predictions_through_time_png(
    phenotype_predictions_table = create_test_phenotype_predictions_table(),
    png_filename = png_filename
  )
  expect_true(file.exists(png_filename))
  file.remove(png_filename)
})
