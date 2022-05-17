test_that("use, example file", {
  pheno_model_filename <- get_gcaer_filename("p0.json")
  pheno_model <- read_pheno_model_file(pheno_model_filename)
})

test_that("use, GCAE file", {
  if (!is_gcae_script_fixed()) return()
  pheno_model_filename <- get_gcae_pheno_model_filename("p1")
  pheno_model <- read_pheno_model_file(pheno_model_filename)
})
