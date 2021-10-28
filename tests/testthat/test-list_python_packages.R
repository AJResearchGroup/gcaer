test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_installed()) return()
  gcae_options <- create_gcae_options(gcae_folder = get_gcaer_tempfilename())
  expect_error(
    list_python_packages(gcae_options = gcae_options),
    "Tip: run 'install_miniconda'"
  )
  install_miniconda(
    miniconda_path = get_miniconda_path(gcae_options = gcae_options)
  )
  python_packages <- list_python_packages(gcae_options = gcae_options)
  python_packages
})
