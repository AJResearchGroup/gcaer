test_that("use", {
  data <- "HumanOrigins249_tiny"
  gcae_setup <- create_gcae_setup()
  trainedmodelname <- get_gcae_trainedmodelname(
    data = data,
    gcae_setup = gcae_setup
  )
  expect_equal(
    trainedmodelname,
    "ae.M1.ex3.b_0_4.HumanOrigins249_tiny"
  )
})
