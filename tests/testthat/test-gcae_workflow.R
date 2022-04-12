test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_script_fixed()) return()

  # This test goes through the full workflow.
  # It is not broken up into small pieces, as each 'small piece'
  # takes multiple seconds to run.
  #
  # 1. Setup
  # 2. Train
  # 3. Project
  # 4. Plot

  # 1. Setup
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
      normalizePath(get_gcaer_tempfilename(), mustWork = FALSE), "/"
    )
  )

  # 2. Train, approx 3 mins
  Sys.time()
  train_filenames <- gcae_train(
    gcae_setup = gcae_setup,
    epochs = 1,
    save_interval = 1,
    verbose = TRUE
  )
  expect_true(all(file.exists(train_filenames)))

  # 3. Project
  Sys.time()
  project_filenames <- gcae_project(
    gcae_setup = gcae_setup,
    gcae_options = gcae_options,
    verbose = TRUE
  )
  Sys.time()

  project_results <- parse_project_files(project_filenames)
  expect_equal(
    names(project_results),
    c("losses_from_project_table", "genotype_concordances_table")
  )

  # 4. Plot
  if (1 == 2) {
    plot_filenames <- gcae_plot(
      superpops = gcae_setup$superpops,
      gcae_setup = gcae_setup,
      verbose = TRUE
    )
    plot_filenames
    Sys.time()
  }
  if (1 == 2) {
    gcae_evaluate(
      gcae_setup = gcae_setup,
      gcae_options = gcae_options,
      verbose = TRUE
    )
  }
})
