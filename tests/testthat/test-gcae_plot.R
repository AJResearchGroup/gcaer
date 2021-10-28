test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_installed()) return()
  gcae_options <- create_gcae_options()
  data <- "HumanOrigins249_tiny"
  datadir <- file.path(
    get_gcae_subfolder(gcae_options = gcae_options),
    "example_tiny/"
  )
  gcae_setup <- create_gcae_setup(
    datadir = datadir,
    data = data
  )
  gcae_train(
    gcae_setup = gcae_setup,
    epochs = 3,
    save_interval = 1,
    gcae_options = gcae_options
  )
  superpops <- file.path(datadir, "HO_superpopulations")
  gcae_project(
    superpops = superpops,
    gcae_setup = gcae_setup,
    gcae_options = gcae_options
  )
  plot_filenames <- gcae_plot(
    superpops = superpops,
    gcae_setup = gcae_setup,
    gcae_options = gcae_options,
    verbose = TRUE
  )
  plot_filenames
})
