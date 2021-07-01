test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_gcae_installed()) return()
  datadir <- file.path(get_gcae_subfolder(), "example_tiny/")
  data <- "HumanOrigins249_tiny"
  model_id <- "M1"
  train_opts_id <- "ex3"
  data_opts_id <- "b_0_4"
  expect_silent(
    gcae_train(
      datadir = datadir,
      data = data,
      model_id = model_id,
      train_opts_id = train_opts_id,
      data_opts_id = data_opts_id
    )
  )

  expect_error(
    gcae_train(
      datadir = "nonsense/",
      data = "HumanOrigins249_tiny",
      model_id = "M1",
      train_opts_id = "ex3",
      data_opts_id = "b_0_4"
    ),
    "Error"
  )
  expect_error(
    gcae_train(
      datadir = "example_tiny/",
      data = "nonsense",
      model_id = "M1",
      train_opts_id = "ex3",
      data_opts_id = "b_0_4",
      verbose = TRUE
    ),
    "Error"
  )

  expect_error(
    gcae_train(
      datadir = "example_tiny/",
      data = "HumanOrigins249_tiny",
      model_id = "nonsense",
      train_opts_id = "ex3",
      data_opts_id = "b_0_4"
    ),
    "Error"
  )
  expect_error(
    gcae_train(
      datadir = "example_tiny/",
      data = "HumanOrigins249_tiny",
      model_id = "M1",
      train_opts_id = "nonsense",
      data_opts_id = "b_0_4"
    ),
    "Error"
  )
  expect_error(
    gcae_train(
      datadir = "example_tiny/",
      data = "HumanOrigins249_tiny",
      model_id = "M1",
      train_opts_id = "ex3",
      data_opts_id = "nonsense"
    ),
    "Error"
  )
})