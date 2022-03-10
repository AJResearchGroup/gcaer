test_that("analyse_qt_prediction", {
  skip("Not a general test yet")
  datadir <- "/home/richel/GitHubs/richel/issue_141/sim_data_1_richel_issue_140"
  trainedmodeldir <-
    "/home/richel/GitHubs/richel/issue_141/sim_data_1_richel_issue_140_ae"
  unique_id <- "my_unique_id"
  verbose <- FALSE
  analyse_qt_prediction(
    datadir = datadir,
    trainedmodeldir = trainedmodeldir,
    unique_id = unique_id,
    verbose = verbose
  )
})
