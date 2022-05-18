test_that("use", {
  pheno_model_ids <- get_gcae_pheno_model_ids()
  expect_equal(
    length(pheno_model_ids),
    length(get_gcae_pheno_model_filenames())
  )
  for (pheno_model_id in pheno_model_ids) {
    expect_silent(check_pheno_model_id(pheno_model_id))
  }
})

test_that("use on experimental pheno_models", {
  # the 'Pheno' branch on github.com/richelbilderbeek/GenoCAE
  gcae_folder <- "~/GitHubs/gcae"
  if (!dir.exists(gcae_folder)) return()
  gcae_options <- create_gcae_options(gcae_folder = "~/GitHubs/gcae")
  pheno_model_ids <- get_gcae_pheno_model_ids(gcae_options = gcae_options)
  expect_equal(
    length(pheno_model_ids),
    length(get_gcae_pheno_model_filenames(gcae_options = gcae_options))
  )
  for (pheno_model_id in pheno_model_ids) {
    expect_silent(check_pheno_model_id(pheno_model_id))
  }
})

test_that("use", {
  pheno_model_ids <- get_gcae_pheno_model_ids(
    gcae_options = create_gcae_options(
      gcae_folder = get_gcaer_tempfilename()
    )
  )
  expect_equal(length(pheno_model_ids), 0)
})
