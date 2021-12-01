test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_gcae_installed()) return()
  gcae_options <- create_gcae_options(gcae_folder = get_gcaer_tempfilename())
  expect_silent(clone_gcae_repo(gcae_options))
  fix_gcae_script(gcae_options = gcae_options)
  unlink(gcae_options$gcae_folder, recursive = TRUE)
})

test_that("cannot fix twice", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_gcae_installed()) return()
  gcae_options <- create_gcae_options(gcae_folder = get_gcaer_tempfilename())
  expect_silent(clone_gcae_repo(gcae_options))
  fix_gcae_script(gcae_options = gcae_options)
  expect_error(
    fix_gcae_script(gcae_options = gcae_options),
    "GCAE script is already fixed"
  )
  unlink(gcae_options$gcae_folder, recursive = TRUE)
})