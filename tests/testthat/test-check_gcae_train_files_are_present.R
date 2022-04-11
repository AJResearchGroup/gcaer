test_that("abuse", {
  expect_error(
    check_gcae_train_files_are_present(
      gcae_setup = "nonsense",
      gcae_options = create_gcae_options()
    ),
    "'gcae_setup' must be a list"
  )
})
