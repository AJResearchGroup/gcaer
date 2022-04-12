test_that("use", {
  if (!is_gcae_script_fixed()) return()
  pheno_model_filename <- get_gcae_pheno_model_filename("p0")
  expect_true(file.exists(pheno_model_filename))
})
