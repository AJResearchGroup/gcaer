test_that("use", {
  skip("TODO, now returns the CSVs")
  folder_name <- get_gcaer_tempfilename()
  png_filenames <- create_plots_from_gcae_experiment_results(
    folder_name = folder_name
  )
  expect_true(all(file.exists(unlist(png_filenames))))
  file.remove(unlist(png_filenames))
})
