test_that("use", {
  expect_silent(
    get_gcae_output_subfolder(
      gcae_setup = create_gcae_setup(
        datadir = "my_datadir/",
        data = "HumanOrigins249_tiny"
      )
    )
  )
})
