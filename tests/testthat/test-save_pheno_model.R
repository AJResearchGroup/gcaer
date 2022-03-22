test_that("use", {
  pheno_model_filename <- gcaer::get_gcae_pheno_model_filename("p1")
  skip("WIP")
  pheno_model <- gcaer::read_pheno_model(pheno_model_filename)
  new_pheno_model_filename <- get_gcaer_tempfilename(
    pattern = "p314_",
    fileext = ".json"
  )
  save_pheno_model(
    pheno_model = pheno_model,
    pheno_model_filename = new_pheno_model_filename
  )

  new_pheno_model <- gcaer::read_pheno_model(new_pheno_model_filename)
  expect_identical(new_pheno_model, pheno_model)
})
