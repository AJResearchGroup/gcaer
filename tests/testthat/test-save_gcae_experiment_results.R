test_that("use", {
  # Create a gcae_experiment_results
  gcae_experiment_results <- create_test_gcae_experiment_results()

  # Use a temporary folder
  folder_name <- get_gcaer_tempfilename()

  # Save gcae_experiment_results to temporary file
  filenames <- save_gcae_experiment_results(
    gcae_experiment_results = gcae_experiment_results,
    folder_name = folder_name
  )
  expect_true(all(file.exists(unlist(filenames))))

  # Cleanup
  file.remove(unlist(filenames))
})
