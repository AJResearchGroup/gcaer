test_that("use", {
  gcae_setup <- create_gcae_setup(
    datadir = "my_datadir/",
    data = "HumanOrigins249_tiny",
    pheno_model_id = "p2"
  )
  trainedmodelname <- get_gcae_trainedmodelname(
    gcae_setup = gcae_setup
  )
  expect_equal(
    trainedmodelname,
    "ae.M1.ex3.b_0_4.HumanOrigins249_tiny"
  )
})
