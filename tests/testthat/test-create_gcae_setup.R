test_that("use", {
  datadir <- "my_datadir/"
  data <- "HumanOrigins249_tiny"
  model_id <- "M1"
  train_opts_id <- "ex3"
  data_opts_id <- "b_0_4"
  gcae_setup <- create_gcae_setup(
    datadir = datadir,
    data = data,
    model_id = model_id,
    train_opts_id = train_opts_id,
    data_opts_id = data_opts_id
  )
  expect_equal(datadir, gcae_setup$datadir)
  expect_equal(data, gcae_setup$data)
  expect_equal(model_id, gcae_setup$model_id)
  expect_equal(train_opts_id, gcae_setup$train_opts_id)
  expect_equal(data_opts_id, gcae_setup$data_opts_id)
})
