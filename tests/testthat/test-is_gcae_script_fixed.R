test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_gcae_installed()) return()
  gcae_options <- create_gcae_options()
  expect_silent(clone_gcae_repo(gcae_options))
  expect_false(is_gcae_script_fixed(gcae_options = gcae_options))
  fix_gcae_script(gcae_options = gcae_options)
  expect_true(is_gcae_script_fixed(gcae_options = gcae_options))
  unlink(gcae_options$gcae_folder, recursive = TRUE)
})
