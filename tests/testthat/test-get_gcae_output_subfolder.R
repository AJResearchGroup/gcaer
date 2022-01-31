test_that("use", {
  expect_silent(
    get_gcae_output_subfolder(
      gcae_setup = create_gcae_setup(
        datadir = "my_datadir/",
        data = "HumanOrigins249_tiny",
        pheno_model_id = "p2",
        trainedmodeldir = "there"
      )
    )
  )
  expect_true(
    stringr::str_detect(
      string = get_gcae_output_subfolder(
        gcae_setup = create_gcae_setup(
          datadir = "my_datadir/",
          data = "issue_6_bin",
          pheno_model_id = "p2",
          trainedmodeldir = "trainedmodeldir"
        )
      ),
      pattern = "trainedmodeldirae\\.M1.ex3\\.b_0_4\\.issue_6_bin\\.p2$"
    )
  )
})
