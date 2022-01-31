test_that("use", {
  expect_silent(
    check_gcae_setup(
      create_gcae_setup(
        datadir = "my_datadir/",
        data = "HumanOrigins249_tiny",
        superpops = "",
        model_id = "M1",
        train_opts_id = "ex3",
        data_opts_id = "b_0_4",
        pheno_model_id = "p2",
        trainedmodeldir = get_gcaer_tempfilename(pattern = "ae_out")
      )
    )
  )
  expect_error(check_gcae_setup(1))
  expect_error(check_gcae_setup(c(1, 1)))
  expect_error(check_gcae_setup(0))
  expect_error(check_gcae_setup(-1))
  expect_error(check_gcae_setup("nonsense"))
  expect_error(check_gcae_setup(""))
  expect_error(check_gcae_setup(c()))
  expect_error(check_gcae_setup(NA))
  expect_error(check_gcae_setup(NULL))
  expect_error(check_gcae_setup(Inf))
  expect_error(check_gcae_setup(42))
  expect_error(check_gcae_setup(3.14))
})
