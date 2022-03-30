test_that("use", {
  skip("#18")
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_installed()) return()
  clean_gcaer_tempfolder()
  # 1. Setup
  gcae_experiment_params <- create_gcae_experiment_params(
    gcae_options = create_gcae_options(),
    gcae_setup = create_test_gcae_setup(
      model_id = "M0",
      superpops = get_gcaer_filename("gcae_input_files_1_labels.csv")
    ),
    analyse_epochs = c(1, 2),
    metrics = "f1_score_3,f1_score_5"
  )
  gcae_experiment_results <- do_gcae_experiment(
    gcae_experiment_params = gcae_experiment_params
  )
  expect_silent(check_gcae_experiment_results(gcae_experiment_results))
})
