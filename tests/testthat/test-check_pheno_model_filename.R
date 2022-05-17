test_that("use", {

  # How to generat all those model names
  if (1 == 2) {
    gcae_options <- create_gcae_options(gcae_folder = "~/GitHubs/gcae")
    model_ids <- get_gcae_pheno_model_ids(gcae_options = gcae_options)
    cat(
      paste0(
        "expect_silent(check_pheno_model_filename(\"",
        model_ids,
        ".json\"))\n"
      )
    )
  }

  expect_silent(check_pheno_model_filename("p0.json"))
  expect_silent(check_pheno_model_filename("p1.json"))
  expect_silent(check_pheno_model_filename("p2.json"))
  expect_silent(check_pheno_model_filename("~/p0.json"))
  expect_silent(check_pheno_model_filename("/home/me/p2.json"))
  expect_error(check_pheno_model_filename("X2.json"))
  expect_error(check_pheno_model_filename(c("p0.json", "p0.json")))
  expect_error(check_pheno_model_filename("my.txt"))
  expect_error(check_pheno_model_filename(0))
  expect_error(check_pheno_model_filename(-1))
  expect_error(check_pheno_model_filename(""))
  expect_error(check_pheno_model_filename(c()))
  expect_error(check_pheno_model_filename(NA))
  expect_error(check_pheno_model_filename(NULL))
  expect_error(check_pheno_model_filename(Inf))
  expect_error(check_pheno_model_filename(42))
  expect_error(check_pheno_model_filename(3.14))
})
