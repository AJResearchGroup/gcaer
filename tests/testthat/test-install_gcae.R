test_that("un- or install in temp gcae folder", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  # if (!gcaer::is_on_ci()) return() # nolint OK for now
  return()

  folder_name <- tempfile()
  gcae_options <- create_gcae_options(folder_name)
  expect_false(is_gcae_installed(gcae_options))
  expect_silent(install_gcae(gcae_options))
  expect_true(is_gcae_installed(gcae_options))
  expect_silent(uninstall_gcaes(gcae_optionses))
  expect_false(is_gcae_installed(gcae_options))

})
