test_that("use", {
  expect_silent(
    get_gcae_output_subfolder(
      gcae_setup = create_test_gcae_setup()
    )
  )
  expect_true(
    stringr::str_detect(
      string = get_gcae_output_subfolder(
        gcae_setup = create_test_gcae_setup()
      ),
      pattern = "ae\\.M1.ex3\\.b_0_4\\.gcae_input_files_1\\.p2$"
    )
  )
})
