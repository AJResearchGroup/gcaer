test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  gcae_options <- create_gcae_options(gcae_folder = get_gcaer_tempfilename())
  expect_error(is_pip_installed(gcae_options))
  install_miniconda(get_miniconda_path(gcae_options))
  install_pip(gcae_options)
  expect_false(is_pip_installed(gcae_options))
})
