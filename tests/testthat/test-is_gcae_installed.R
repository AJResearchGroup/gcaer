test_that("minimal use", {
  # Useful tests in 'test-install_gcae.R'

  expect_error(
    is_gcae_installed(
      gcae_options = "nonsense"
    ),
    "gcae_options"
  )
  expect_error(
    is_gcae_installed(
      gcae_options = create_gcae_options(),
      verbose = "nonsense"
    ),
    "verbose"
  )
})
