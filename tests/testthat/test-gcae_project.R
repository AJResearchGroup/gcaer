test_that("use", {
  skip("WIP")
  if (!is_gcae_installed()) return()
  gcae_setup <- create_gcae_setup()
  gcae_options <- create_gcae_options()
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
  expect_silent(
    gcae_project(
      datadir = datadir,
      data = data,
      superpops = superpops,
      gcae_setup = gcae_setup,
      gcae_options = gcae_options
    )
  )
})
