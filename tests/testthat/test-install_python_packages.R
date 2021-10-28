test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_gcae_installed()) return()
  gcae_options <- create_gcae_options(gcae_folder = get_gcaer_tempfilename())
  clone_gcae_repo(gcae_options) # Needed for requirements.txt
  install_miniconda(
    miniconda_path = get_miniconda_path(gcae_options = gcae_options)
  )
  install_python_packages(gcae_options)
  unlink(gcae_options$gcae_folder, recursive = TRUE)
})
