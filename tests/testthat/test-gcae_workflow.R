test_that("with phenotype, with superpops", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_script_fixed()) return()

  remove_gcaer_tempfolder()

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
  gcae_setup <- create_test_gcae_setup(
    superpops = get_gcaer_filename("gcae_input_files_1_labels.csv")
  )

  # 2. Train, approx 31 secs
  Sys.time()
  train_filenames <- gcae_train(
    gcae_setup = gcae_setup,
    epochs = 1,
    save_interval = 1,
    verbose = TRUE
  )
  expect_true(all(file.exists(train_filenames)))

  # 3. Project, takes approx 22 secs
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
  Sys.time()
  plot_filenames <- gcae_plot( # Takes approx 18 secs
    gcae_setup = gcae_setup,
    gcae_options = gcae_options,
    verbose = TRUE
  )
  Sys.time()
  expect_true(all(file.exists(plot_filenames)))
  # 5. Evaluate
  gcae_evaluate( # Takes approx 19 secs
    gcae_setup = gcae_setup,
    gcae_options = gcae_options,
    metrics = "f1_score_3",
    epoch = 1,
    verbose = TRUE
  )
  Sys.time()
})
