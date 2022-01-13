test_that("use", {

  gcae_setup <- create_test_gcae_setup()
  epochs <- 1
  save_interval <- 1

  created <- create_gcae_train_args(
    gcae_setup = gcae_setup,
    epochs = epochs,
    save_interval = save_interval
  )
  expected <- c(
    "train",
    "--datadir", gcae_setup$datadir,
    "--data", gcae_setup$data,
    "--model_id", gcae_setup$model_id,
    "--epochs", epochs,
    "--save_interval", save_interval,
    "--train_opts_id", gcae_setup$train_opts_id,
    "--data_opts_id", gcae_setup$data_opts_id,
    paste0("--pheno_model_id=", gcae_setup$pheno_model_id)
  )
  expect_equal(created, expected)
})
