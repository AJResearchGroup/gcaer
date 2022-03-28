test_that("use", {
  skip("#18")
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_installed()) return()
  # 1. Setup
  Sys.time()
  gcae_options <- create_gcae_options()
  gcae_setup <- create_gcae_setup(
    datadir = get_test_datadir(),
    data = "gcae_input_files_1",
    superpops = get_gcaer_filename("gcae_input_files_1_labels.csv"),
    model_id = "M0",
    data_opts_id = "b_0_4",
    train_opts_id = "ex3",
    pheno_model_id = "p2",
    trainedmodeldir = paste0(
      normalizePath(get_gcaer_tempfilename(), mustWork = FALSE), "/"
    )
  )
  gcae_experiment_params <- create_gcae_experiment_params(
    gcae_options = gcae_options,
    gcae_setup = gcae_setup,
    analyse_epochs = seq(1, 2, 3)
  )
  do_gcae_experiment(
    gcae_experiment_params = gcae_experiment_params
  )

})
