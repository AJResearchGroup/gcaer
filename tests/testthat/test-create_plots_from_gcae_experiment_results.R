test_that("use", {
  folder_name <- get_gcaer_tempfilename()
  csv_filenames <- get_gcae_experiment_results_filenames(
    folder_name = folder_name
  )
  dir.create(folder_name, showWarnings = FALSE, recursive = TRUE)
  readr::write_csv(
    x = create_test_genotype_concordances_table(),
    file = csv_filenames$genotype_concordances_filename
  )
  readr::write_csv(
    x = create_test_losses_from_train_t_table(),
    file = csv_filenames$losses_from_train_t_filename
  )
  readr::write_csv(
    x = create_test_losses_from_train_v_table(),
    file = csv_filenames$losses_from_train_v_filename
  )
  readr::write_csv(
    x = create_test_nmse_in_time_table(),
    file = csv_filenames$nmse_in_time_filename
  )
  readr::write_csv(
    x = create_test_phenotype_predictions_table(),
    file = csv_filenames$phenotype_predictions_filename
  )
  readr::write_csv(
    x = create_test_scores_table(),
    file = csv_filenames$scores_filename
  )
  readr::write_csv(
    x = create_test_score_per_pop_table(),
    file = csv_filenames$score_per_pop_filename
  )
  readr::write_csv(
    x = create_test_train_times_table(),
    file = csv_filenames$train_times_filename
  )
  png_filenames <- create_plots_from_gcae_experiment_results(
    folder_name = folder_name
  )

  expect_true(all(file.exists(unlist(png_filenames))))
  unlink(folder_name, recursive = TRUE)
})
