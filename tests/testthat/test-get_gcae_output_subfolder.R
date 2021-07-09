test_that("use", {
  expect_silent(
    get_gcae_output_subfolder(
      data = "something",
      gcae_setup = create_gcae_setup()
    )
  )
})
