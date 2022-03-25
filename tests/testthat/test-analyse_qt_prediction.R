test_that("analyse_qt_prediction", {
  skip("Not a general test yet")
  datadir <-         "/home/richel/GitHubs/nsphs_ml_qt/issues/richel_issue_141/richel_issue_140/home/richel/sim_data_1_richel_issue_140/" # nolint indeed a long path
  trainedmodeldir <- "/home/richel/GitHubs/nsphs_ml_qt/issues/richel_issue_141/richel_issue_140/home/richel/sim_data_1_richel_issue_140_ae/" # nolint indeed a long path
  unique_id <- "richel_issue_141"

  png_filename <- paste0("~/", unique_id, ".png")
  csv_filename_for_nmse <- paste0("~/", unique_id, "_nmse.csv")
  analyse_qt_prediction(
    datadir = datadir,
    trainedmodeldir = trainedmodeldir,
    png_filename = png_filename,
    csv_filename_for_nmse = csv_filename_for_nmse,
    verbose = FALSE
  )
  expect_true(file.exists(png_filename))
  expect_true(file.exists(csv_filename_for_nmse))
})
