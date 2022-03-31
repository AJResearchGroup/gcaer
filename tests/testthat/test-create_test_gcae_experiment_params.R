test_that("use", {
  expect_silent(
    check_gcae_experiment_params(create_test_gcae_experiment_params())
  )
})
