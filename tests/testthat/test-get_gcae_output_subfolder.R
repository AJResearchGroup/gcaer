test_that("use", {
  expect_silent(
    get_gcae_output_subfolder(
      gcae_setup = create_test_gcae_setup()
    )
  )
  pattern <- "ae\\.M[[:digit:]].ex3\\.b_0_4\\.gcae_input_files_1\\.p[[:digit:]]$" # nolint indeed a long regex
  expect_true(
    stringr::str_detect(
      string = get_gcae_output_subfolder(
        gcae_setup = create_test_gcae_setup()
      ),
      pattern = pattern
    )
  )
})

test_that("use, no pheno_model_id, #26", {
  expect_true(
    stringr::str_detect(
      string = get_gcae_output_subfolder(
        gcae_setup = create_test_gcae_setup(pheno_model_id = "")
      ),
      pattern = "ae\\.M[[:digit:]].ex3\\.b_0_4\\.gcae_input_files_1$"
    )
  )
})
