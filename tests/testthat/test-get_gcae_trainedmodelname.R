test_that("use", {
  gcae_setup <- create_test_gcae_setup()
  trainedmodelname <- get_gcae_trainedmodelname(
    gcae_setup = gcae_setup
  )
  expect_equal(
    trainedmodelname,
    "ae.M1.ex3.b_0_4.gcae_input_files_1.p2"
  )
})
