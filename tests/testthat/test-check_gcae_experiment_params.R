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
