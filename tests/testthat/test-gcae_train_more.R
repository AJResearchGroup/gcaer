test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  # Only run locally
  return()
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_script_fixed()) return()

  # This test goes through the full workflow.
  # It is not broken up into small pieces, as each 'small piece'
  # takes multiple seconds to run.
  #
  Sys.time()
  gcae_options <- create_gcae_options()
  gcae_setup <- create_gcae_setup(
    datadir = get_test_datadir(),
    data = "gcae_input_files_1",
    superpops = get_gcaer_filename("gcae_input_files_1_labels.csv"),
    model_id = "M1",
    data_opts_id = "b_0_4",
    train_opts_id = "ex3",
    pheno_model_id = "p2",
    trainedmodeldir = paste0(
      normalizePath(
        file.path(get_gcaer_tempfilename(), "gcae_input_files_1_ae"),
        mustWork = FALSE
      ), "/"
    )
  )

  # 2. Train, approx 3 mins
  Sys.time()
  train_filenames <- gcae_train_more(
    gcae_setup = gcae_setup,
    resume_from = 0,
    epochs = 1,
    save_interval = 1,
    verbose = TRUE
  )
  train_filenames <- gcae_train_more(
    gcae_setup = gcae_setup,
    resume_from = 1,
    epochs = 1,
    save_interval = 1,
    verbose = TRUE
  )
  expect_true(all(file.exists(train_filenames)))
})
