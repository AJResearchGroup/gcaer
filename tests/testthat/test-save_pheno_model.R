test_that("use", {
  skip("WIP")
  pheno_model_filename <- gcaer::get_gcae_pheno_model_filename("p1")
  pheno_model <- gcaer::read_pheno_model(pheno_model_filename)
  n_neurons_before <- get_n_neurons_in_latent_layer(pheno_model)
  expect_equal(75, n_neurons_before)
  new_pheno_model <- set_n_neurons_in_latent_layer(
    pheno_model = pheno_model,
    n_neurons = 1
  )
  n_neurons_after <- get_n_neurons_in_latent_layer(new_pheno_model)
  expect_equal(1, n_neurons_after)

  new_pheno_model_filename <- get_gcaer_tempfilename(
    pattern = "p314_",
    fileext = ".json"
  )
  save_pheno_model(
    pheno_model = new_pheno_model,
    pheno_model_filename = new_pheno_model_filename
  )

  new_pheno_model_again <- gcaer::read_pheno_model(new_pheno_model_filename)
  expect_identical(new_pheno_model_again, new_pheno_model)
})
