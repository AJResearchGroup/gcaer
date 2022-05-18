test_that("use", {
  gcae_experiment_params <- create_test_gcae_experiment_params(
    gcae_options = create_gcae_options(
      gcae_folder = get_gcaer_tempfilename()
    )
  )
  expect_error(
    check_input_files_are_present(gcae_experiment_params),
    "Autoencoder architecture file absent"
  )

  # 'model' must exist, for 'pheno_model' to be checked
  model_filename <- get_gcae_model_filename(
    model_id = gcae_experiment_params$gcae_setup$model_id,
    gcae_options = gcae_experiment_params$gcae_options
  )
  dir.create(dirname(model_filename), recursive = TRUE, showWarnings = FALSE)
  file.create(model_filename)
  expect_error(
    check_input_files_are_present(gcae_experiment_params),
    "Phenotype prediction architecture file absent"
  )
  # 'pheno_model' must exist, for 'train_opts' to be checked
  pheno_model_filename <- get_gcae_pheno_model_filename(
    pheno_model_id = gcae_experiment_params$gcae_setup$pheno_model_id,
    gcae_options = gcae_experiment_params$gcae_options
  )
  dir.create(
    dirname(pheno_model_filename), recursive = TRUE, showWarnings = FALSE
  )
  file.create(pheno_model_filename)
  expect_error(
    check_input_files_are_present(gcae_experiment_params),
    "Training options file absent"
  )
  # 'train_opts' must exist, for 'data_opts' to be checked
  train_opts_filename <- get_gcae_train_opts_filename(
    train_opts_id = gcae_experiment_params$gcae_setup$train_opts_id,
    gcae_options = gcae_experiment_params$gcae_options
  )
  dir.create(
    dirname(train_opts_filename), recursive = TRUE, showWarnings = FALSE
  )
  file.create(train_opts_filename)
  expect_error(
    check_input_files_are_present(gcae_experiment_params),
    "Data storage options file absent"
  )
  # 'data_opts' must exist, for 'superpops' to be checked
  data_opts_filename <- get_gcae_data_opts_filename(
    data_opts_id = gcae_experiment_params$gcae_setup$data_opts_id,
    gcae_options = gcae_experiment_params$gcae_options
  )
  dir.create(
    dirname(data_opts_filename), recursive = TRUE, showWarnings = FALSE
  )
  file.create(data_opts_filename)
  gcae_experiment_params$gcae_setup$superpops <- get_gcaer_tempfilename(
    pattern = "superpops_", fileext = ".csv"
  )
  gcae_experiment_params$metrics <- "f1_score_3"
  expect_error(
    check_input_files_are_present(gcae_experiment_params),
    "Superpopulations file is absent"
  )
  # 'superpops' must exist, for all files to exist
  superpops_filename <- gcae_experiment_params$gcae_setup$superpops
  dir.create(
    dirname(superpops_filename), recursive = TRUE, showWarnings = FALSE
  )
  file.create(superpops_filename)
  expect_silent(
    check_input_files_are_present(gcae_experiment_params)
  )

  # If 'pheno_model_id', there is no problem either
  gcae_experiment_params$gcae_setup$pheno_model_id <- ""
  expect_silent(
    check_input_files_are_present(gcae_experiment_params)
  )

  # If no 'superpops' and no 'metrics', there is no problem either
  gcae_experiment_params$gcae_setup$superpops <- ""
  gcae_experiment_params$metrics <- ""
  expect_silent(
    check_input_files_are_present(gcae_experiment_params)
  )
})
