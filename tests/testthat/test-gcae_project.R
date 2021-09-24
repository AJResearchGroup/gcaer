test_that("use", {
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
  superpops <- file.path(datadir, "HO_superpopulations")
  expect_silent(
    gcae_train(
      gcae_setup = gcae_setup,
      gcae_options = gcae_options,
      epochs = 3,
      save_interval = 1
    )
  )
  project_filenames <- gcae_project(
    superpops = superpops,
    gcae_setup = gcae_setup,
    gcae_options = gcae_options
  )
  expect_true(all(file.exists(project_filenames)))
})
