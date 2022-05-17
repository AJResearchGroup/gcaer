test_that("use", {
  # Will be zero filenames if GCAE is not installed
  pheno_model_filenames <- get_gcae_pheno_model_filenames()
  for (pheno_model_filename in pheno_model_filenames) {
    expect_silent(check_pheno_model_filename(pheno_model_filename))
    expect_silent(read_pheno_model_file(pheno_model_filename))
  }
})
