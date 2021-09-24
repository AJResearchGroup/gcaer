test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_gcae_installed()) return()
  gcae_setup <- create_gcae_setup(
    datadir = file.path(get_gcae_subfolder(), "example_tiny/"),
    data = "HumanOrigins249_tiny"
  )
  train_filenames <- gcae_train(
    gcae_setup = gcae_setup,
    epochs = 1,
    save_interval = 1
  )
  expect_true(all(file.exists(train_filenames)))
})

test_that("abuse", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_gcae_installed()) return()
  gcae_setup <- create_gcae_setup(
    datadir = file.path(get_gcae_subfolder(), "example_tiny/"),
    data = "HumanOrigins249_tiny"
  )
  expect_error(
    gcae_train(
      gcae_setup = "nonsense"
    ),
    "'gcae_setup' must be a list"
  )

})
