test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  gcae_options <- create_gcae_options(gcae_folder = tempfile())
  expect_error(
    check_gcae_script_is_fixed(gcae_options = gcae_options),
    "GCAE repository is not cloned"
  )
  clone_gcae_repo(gcae_options = gcae_options)
  expect_error(
    check_gcae_script_is_fixed(gcae_options = gcae_options),
    "GCAE script is not fixed."
  )
})
