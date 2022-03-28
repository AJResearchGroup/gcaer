test_that("use", {
  if (!is_gcae_installed()) return()
  pheno_model_filename <- get_gcae_pheno_model_filename("p0")
  expect_true(file.exists(pheno_model_filename))
})
