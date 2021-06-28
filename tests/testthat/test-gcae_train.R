test_that("use", {
  skip("WIP")

  expect_silent(
    gcae_train(
      datadir = file.path(get_gcae_subfolder(), "example_tiny/"),
      data = "HumanOrigins249_tiny",
      model_id = "M1",
      epochs = 20,
      save_interval = 2,
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
