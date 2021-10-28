test_that("use", {
  gcae_options <- create_gcae_options(gcae_folder = get_gcaer_tempfilename())
  miniconda_path <- get_miniconda_path(gcae_options)
  expect_false(is_miniconda_installed(miniconda_path = miniconda_path))
  install_miniconda(miniconda_path = miniconda_path)
  expect_true(is_miniconda_installed(miniconda_path = miniconda_path))
  unlink(gcae_options$gcae_folder, recursive = TRUE)
})
