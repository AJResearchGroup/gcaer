test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_gcae_installed()) return()
  expect_silent(
    gcae_train(
      datadir = file.path(get_gcae_subfolder(), "example_tiny/"),
      data = "HumanOrigins249_tiny",
      model_id = "M1",
      epochs = 1,
      save_interval = 1,
      train_opts_id = "ex3",
      data_opts_id = "b_0_4"
    )
  )
  expect_error(
    gcae_train(
      datadir = "example_tiny/",
      data = "HumanOrigins249_tiny",
      model_id = "M1",
      epochs = 20,
      save_interval = 2,
      train_opts_id = "ex3",
      data_opts_id = "b_0_4"
    ),
    "FileNotFoundError"
  )
})
