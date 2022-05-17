test_that("use", {

  gcae_setup <- create_test_gcae_setup()
  resume_from <- 10
  epochs <- 20
  save_interval <- 1

  created <- create_gcae_train_more_args(
    gcae_setup = gcae_setup,
    resume_from = resume_from,
    epochs = epochs,
    save_interval = save_interval
  )
  expected <- c(
    "train",
    "--datadir", gcae_setup$datadir,
    "--data", gcae_setup$data,
    "--model_id", gcae_setup$model_id,
    "--resume_from", resume_from, # Unique
    "--epochs", epochs,
    "--save_interval", save_interval,
    "--train_opts_id", gcae_setup$train_opts_id,
    "--data_opts_id", gcae_setup$data_opts_id,
    "--trainedmodeldir", gcae_setup$trainedmodeldir,
    "--pheno_model_id", gcae_setup$pheno_model_id
  )
  expect_equal(created, expected)
})

test_that("use, no --pheno-model-id, #26", {
  args <- create_gcae_train_more_args(
    gcae_setup = create_test_gcae_setup(pheno_model_id = ""),
    resume_from = 10,
    epochs = 20,
    save_interval = 1
  )
  expect_false("--pheno_model_id" %in% args)
  expect_false("" %in% args)
})
