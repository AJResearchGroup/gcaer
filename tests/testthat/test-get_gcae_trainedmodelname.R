test_that("use", {
  gcae_setup <- create_test_gcae_setup()

  expect_true(
    stringr::str_detect(
      string = trainedmodelname <- get_gcae_trainedmodelname(
        gcae_setup = gcae_setup
      ),
      pattern = "ae.M[[:digit:]].ex3.b_0_4.gcae_input_files_1.p[[:digit:]]$"
    )
  )
})
