test_that("use", {
  expect_silent(
    check_gcae_args(
      create_gcae_project_args(
        create_test_gcae_setup()
      )
    )
  )

  expect_silent(
    check_gcae_args(
      create_gcae_project_args(
        create_test_gcae_setup(superpops = "")
      )
    )
  )
  expect_silent(
    check_gcae_args(
      create_gcae_project_args(
        create_test_gcae_setup(pheno_model_id = "")
      )
    )
  )
})
