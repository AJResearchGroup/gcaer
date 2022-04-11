test_that("use", {
  gif_filename <- get_gcaer_tempfilename(fileext = ".gif")
  create_phenotype_prediction_through_time_gif(
    phenotype_predictions_table = create_test_phenotype_predictions_table(),
    gif_filename = gif_filename
  )
  expect_true(file.exists(gif_filename))
  file.remove(gif_filename)
})
