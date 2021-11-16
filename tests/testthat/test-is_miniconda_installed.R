test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  gcae_options <- create_gcae_options(gcae_folder = get_gcaer_tempfilename())
  miniconda_path <- get_miniconda_path(gcae_options)

  expect_false(is_miniconda_installed(miniconda_path = miniconda_path))
  gcaer_report(gcae_options = gcae_options)
  reticulate::conda_list()

  install_miniconda(miniconda_path = miniconda_path)
  reticulate::use_miniconda(condaenv = miniconda_path)

  reticulate::use_condaenv(condaenv = python_binary_path)
  reticulate::py_
  reticulate::conda_python(envname = miniconda_path)
  reticulate::mini

  expect_true(is_miniconda_installed(miniconda_path = miniconda_path))
  gcaer_report(gcae_options = gcae_options)

  unlink(gcae_options$gcae_folder, recursive = TRUE)
})
