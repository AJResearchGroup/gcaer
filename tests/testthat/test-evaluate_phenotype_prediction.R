test_that("abuse", {
  gcae_experiment_params <- create_test_gcae_experiment_params()
  epoch <- 100

  # Prepare to trigger the error message
  dir.create(gcae_experiment_params$gcae_setup$trainedmodeldir)

  expect_error(
    evaluate_phenotype_prediction(
      gcae_experiment_params = gcae_experiment_params,
      epoch = epoch
    ),
    "Must find at least one '.phe' file in 'trainedmodeldir'"
  )

  phe_table <- plinkr::read_plink_phe_file(
    phe_filename = paste0(
      gcae_experiment_params$gcae_setup$datadir,
      gcae_experiment_params$gcae_setup$data,
      ".phe"
    )
  )

  # Create two phenotype files in trainedmodeldir
  # to check if regex is precise enough
  plinkr::save_phe_table(
    phe_table = phe_table,
    phe_filename = paste0(
      gcae_experiment_params$gcae_setup$trainedmodeldir,
      epoch, ".phe"
    )
  )
  plinkr::save_phe_table(
    phe_table = phe_table,
    phe_filename = paste0(
      gcae_experiment_params$gcae_setup$trainedmodeldir,
      "1", epoch, ".phe" # the 1 forces the regex to be precise
    )
  )

  expect_silent(
    evaluate_phenotype_prediction(
      gcae_experiment_params = gcae_experiment_params,
      epoch = 100
    )
  )
})
