test_that("use", {
  gcae_options <- create_gcae_options(gcae_folder = get_gcaer_tempfilename())
  expect_error(is_pip_installed(gcae_options))
  install_miniconda(get_miniconda_path(gcae_options))
  expect_false(is_pip_installed(gcae_options))
})
