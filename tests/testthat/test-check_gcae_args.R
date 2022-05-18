test_that("use", {
  expect_silent(check_gcae_args(args = "--help"))
  expect_error(check_gcae_args(args = "--nonsense"))

  expect_silent(
    check_gcae_args(
      args = create_gcae_train_args(
        gcae_setup = create_test_gcae_setup(),
        epochs = 1,
        save_interval = 1
      )
    )
  )
})

test_that("no --pheno_model_id when it is an empty string, #26", {
  args <- create_gcae_train_args(
    gcae_setup = create_test_gcae_setup(pheno_model_id = "p0"),
    epochs = 1,
    save_interval = 1
  )
  args[args == "p0"] <- ""
  expect_error(check_gcae_args(args))
})
