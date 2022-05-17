test_that("use", {
  model_ids <- get_gcae_model_ids()
  testthat::expect_equal(length(model_ids), length(get_gcae_model_filenames()))
  for (model_id in model_ids) {
    expect_silent(check_model_id(model_id))
  }
})

test_that("use on experimental models", {
  # the 'Pheno' branch on github.com/richelbilderbeek/GenoCAE
  gcae_folder <- "~/GitHubs/gcae"
  if (!dir.exists(gcae_folder)) return()
  gcae_options <- create_gcae_options(gcae_folder = "~/GitHubs/gcae")
  model_ids <- get_gcae_model_ids(gcae_options = gcae_options)
  testthat::expect_equal(length(model_ids), length(get_gcae_model_filenames(gcae_options = gcae_options)))
  for (model_id in model_ids) {
    expect_silent(check_model_id(model_id))
  }
})
