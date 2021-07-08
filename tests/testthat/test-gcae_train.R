test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_gcae_installed()) return()
  datadir <- file.path(get_gcae_subfolder(), "example_tiny/")
  data <- "HumanOrigins249_tiny"
  gcae_setup <- create_gcae_setup()
  train_filenames <- gcae_train(
    datadir = datadir,
    data = data,
    gcae_setup = gcae_setup,
    epochs = 1,
    save_interval = 1
  )
  expect_true(all(file.exists(train_filenames)))
})

test_that("abuse", {
  expect_error(
    gcae_train(
      datadir = "nonsense/",
      data = "HumanOrigins249_tiny",
      gcae_setup = gcae_setup
    ),
    "Error"
  )
  expect_error(
    gcae_train(
      datadir = "example_tiny/",
      data = "nonsense",
      gcae_setup = gcae_setup
    ),
    "Error"
  )

  expect_error(
    gcae_train(
      datadir = "example_tiny/",
      data = "HumanOrigins249_tiny",
      gcae_setup = "nonsense"
    ),
    "'gcae_setup' must be a list"
  )

})
