test_that("use, with superpops", {
  expect_silent(
    check_gcae_experiment_params(
      create_gcae_experiment_params(
        gcae_options = create_gcae_options(),
        gcae_setup = create_test_gcae_setup(
          superpops = "some_file.csv"
        ),
        analyse_epochs = seq(1, 2, 3),
        metrics = "f1_score_3,f1_score_5"
      )
    )
  )
  expect_error(
    check_gcae_experiment_params(
      create_gcae_experiment_params(
        gcae_options = create_gcae_options(),
        gcae_setup = create_test_gcae_setup(
          superpops = "some_file.csv"
        ),
        analyse_epochs = seq(1, 2, 3),
        metrics = ""
      )
    ),
    "Must define 'metrics' when using 'superpops'"
  )
})

test_that("use, without superpops", {
  expect_silent(
    check_gcae_experiment_params(
      create_gcae_experiment_params(
        gcae_options = create_gcae_options(),
        gcae_setup = create_test_gcae_setup(
          superpops = ""
        ),
        analyse_epochs = seq(1, 2, 3),
        metrics = ""
      )
    )
  )
  expect_error(
    check_gcae_experiment_params(
      create_gcae_experiment_params(
        gcae_options = create_gcae_options(),
        gcae_setup = create_test_gcae_setup(
          superpops = ""
        ),
        analyse_epochs = seq(1, 2, 3),
        metrics = "f1_score_3"
      )
    ),
    "Must define 'superpops' when using 'metrics'"
  )
})
