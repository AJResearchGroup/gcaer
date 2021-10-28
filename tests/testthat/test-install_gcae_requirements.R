test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_installed()) return()
  gcae_options <- create_gcae_options(gcae_folder = get_gcaer_tempfilename())
  install_gcae_requirements(gcae_options)
})
