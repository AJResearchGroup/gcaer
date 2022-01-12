test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_installed()) return()

  # This test goes through the full workflow.
  # It is not broken up into small pieces, as each 'small piece'
  # takes multiple seconds to run.
  #
  # 1. Setup
  # 2. Train
  # 3. Project
  # 4. Plot

  # 1. Setup
  datadir <- file.path(get_gcae_subfolder(), "example_tiny/")
  data <- "issue_6_bin"
  gcae_setup <- create_gcae_setup(
    datadir = datadir,
    data = data,
    model_id = "M1",
    pheno_model_id = "p2"
  )
  superpops <- clean_file_path(file.path(datadir, "HO_superpopulations"))

  # 2. Train, approx 3 mins
  Sys.time()
  train_filenames <- gcae_train(
    gcae_setup = gcae_setup,
    epochs = 1,
    save_interval = 1
  )
  expect_true(all(file.exists(train_filenames)))

  # 3. Project
  Sys.time()
  project_filenames <- gcae_project(
    superpops = superpops,
    gcae_setup = gcae_setup,
    verbose = TRUE
  )
  Sys.time()

  project_results <- parse_project_files(project_filenames)
  expect_equal(
    names(project_results),
    c("losses_from_project_table", "genotype_concordances_table")
  )

  # 4. Plot
  plot_filenames <- gcae_plot(
    superpops = superpops,
    gcae_setup = gcae_setup,
    gcae_options = gcae_options,
    verbose = TRUE
  )
  plot_filenames

})
