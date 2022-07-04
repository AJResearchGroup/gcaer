test_that("use", {
  expect_silent(
    check_gcae_experiment_params(
      create_gcae_experiment_params(
        gcae_options = create_gcae_options(),
        gcae_setup = create_test_gcae_setup(),
        analyse_epochs = seq(1, 2, 3),
        metrics = "f1_score_3"
      )
    )
  )
  expect_error(check_gcae_experiment_params(1))
  expect_error(check_gcae_experiment_params(c(1, 1)))
  expect_error(check_gcae_experiment_params(0))
  expect_error(check_gcae_experiment_params(-1))
  expect_error(check_gcae_experiment_params("nonsense"))
  expect_error(check_gcae_experiment_params(""))
  expect_error(check_gcae_experiment_params(c()))
  expect_error(check_gcae_experiment_params(NA))
  expect_error(check_gcae_experiment_params(NULL))
  expect_error(check_gcae_experiment_params(Inf))
  expect_error(check_gcae_experiment_params(42))
  expect_error(check_gcae_experiment_params(3.14))
})
