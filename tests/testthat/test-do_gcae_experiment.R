test_that("use, without labels", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_script_fixed()) return()
  clean_gcaer_tempfolder()
  gcae_experiment_params <- create_gcae_experiment_params(
    gcae_options = create_gcae_options(),
    gcae_setup = create_test_gcae_setup(
      model_id = "M0",
      superpops = "", # no labels
      pheno_model_id = "p0"
    ),
    analyse_epochs = c(1, 2),
    metrics = "" # no metrics
  )
  gcae_experiment_results <- do_gcae_experiment(
    gcae_experiment_params = gcae_experiment_params
  )
  expect_silent(check_gcae_experiment_results(gcae_experiment_results))
  save_gcae_experiment_results(
    gcae_experiment_results = gcae_experiment_results,
    folder_name = gcae_experiment_params$gcae_setup$trainedmodeldir
  )
  create_plots_from_gcae_experiment_results(
    folder_name = gcae_experiment_params$gcae_setup$trainedmodeldir
  )
})

test_that("use, with labels", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_script_fixed()) return()
  clean_gcaer_tempfolder()
  gcae_experiment_params <- create_gcae_experiment_params(
    gcae_options = create_gcae_options(),
    gcae_setup = create_test_gcae_setup(
      model_id = "M0",
      superpops = get_gcaer_filename("gcae_input_files_1_labels.csv"),
      pheno_model_id = "p0"
    ),
    analyse_epochs = c(1, 2),
    metrics = "f1_score_3,f1_score_5"
  )
  gcae_experiment_results <- do_gcae_experiment(
    gcae_experiment_params = gcae_experiment_params
  )
  expect_silent(check_gcae_experiment_results(gcae_experiment_results))
  save_gcae_experiment_results(
    gcae_experiment_results = gcae_experiment_results,
    folder_name = gcae_experiment_params$gcae_setup$trainedmodeldir
  )
  create_plots_from_gcae_experiment_results(
    folder_name = gcae_experiment_params$gcae_setup$trainedmodeldir
  )
})

test_that("abuse", {
  expect_error(
    do_gcae_experiment(gcae_experiment_params = "nonsense"),
    "'gcae_experiment_params' must be a list"
  )
})



test_that("profiling, M1", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_script_fixed()) return()
  clean_gcaer_tempfolder()
  gcae_experiment_params <- create_gcae_experiment_params(
    gcae_setup = create_test_gcae_setup(
      model_id = "M0",
      superpops = get_gcaer_filename("gcae_input_files_1_labels.csv")
    ),
    analyse_epochs = seq(10, 100, by = 10),
    metrics = paste0(paste0("f1_score_", seq(3, 19, by = 2)), collapse = ","),
    gcae_options = create_gcae_options()
  )
  Sys.time() # 2022-03-31 19:32:08 CEST"
  profvis::profvis({
    do_gcae_experiment(gcae_experiment_params = gcae_experiment_params)
  })
  Sys.time() # "2022-03-31 22:43:05 CEST"

})
