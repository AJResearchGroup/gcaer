test_that("analyse_qt_prediction", {
  skip("Not a general test yet")
  datadir <-         "/home/richel/GitHubs/richel/issue_127/sim_data_2_richel_issue_126"
  trainedmodeldir <- "/home/richel/GitHubs/richel/issue_127/sim_data_2_richel_issue_126_ae"
  unique_id <- "richel_issue_126"

  datadir <-         "/home/richel/GitHubs/richel/issue_127/sim_data_2_richel_issue_127"
  trainedmodeldir <- "/home/richel/GitHubs/richel/issue_127/sim_data_2_richel_issue_127_ae"
  unique_id <- "richel_issue_127"

  datadir <-         "/home/richel/GitHubs/richel/issue_141/richel_issue_140/home/richel/sim_data_1_richel_issue_140"
  trainedmodeldir <- "/home/richel/GitHubs/richel/issue_141/richel_issue_140/home/richel/sim_data_1_richel_issue_140_ae"
  unique_id <- "richel_issue_141"

  png_filename <- paste0("~/", unique_id, ".png")
  analyse_qt_prediction(
    datadir = datadir,
    trainedmodeldir = trainedmodeldir,
    png_filename = png_filename,
    verbose = FALSE
  )
  expect_true(file.exists(png_filename))
})
