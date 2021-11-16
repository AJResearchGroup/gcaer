test_that("minimal use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()

  # See test-is_miniconda_installed for more thorough tests
  gcae_options <- create_gcae_options(gcae_folder = get_gcaer_tempfilename())

  # Cannot do expect_silent :-(
  install_miniconda(miniconda_path = get_miniconda_path(gcae_options))
  unlink(gcae_options$gcae_folder, recursive = TRUE)
})
