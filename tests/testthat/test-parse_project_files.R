test_that("use", {
  if (!is_gcae_installed()) return()
  gcae_setup <- create_gcae_setup()
  gcae_options <- create_gcae_options()
  data <- "HumanOrigins249_tiny"
  datadir <- file.path(
    get_gcae_subfolder(gcae_options = gcae_options),
    "example_tiny/"
  )
  superpops <- file.path(datadir, "HO_superpopulations")
  gcae_train(
    datadir = datadir,
    data = data,
    gcae_setup = gcae_setup,
    gcae_options = gcae_options,
    epochs = 3,
    save_interval = 1
  )
  project_filenames <- gcae_project(
    datadir = datadir,
    data = data,
    superpops = superpops,
    gcae_setup = gcae_setup,
    gcae_options = gcae_options
  )
  project_results <- parse_project_files(project_filenames)
  expect_equal(
    names(project_results),
    c("losses_from_project_table", "genotype_concordances_table")
  )
})
