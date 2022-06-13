test_that("use", {
  experiment_results_filenames <- get_gcae_experiment_results_filenames(
    folder_name = "my_folder"
  )
  expect_true(
    "r_squared_in_time_filename" %in% names(experiment_results_filenames)
  )
})
