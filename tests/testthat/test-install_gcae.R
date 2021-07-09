test_that("un- or install in temp gcae folder", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (plinkr::get_os() == "win") return()

  gcae_folder <- normalizePath(get_gcaer_tempfilename(), mustWork = FALSE)
  gcae_options <- create_gcae_options(gcae_folder = gcae_folder)
  expect_false(is_gcae_installed(gcae_options))
  expect_silent(install_gcae(gcae_options))
  expect_true(is_gcae_installed(gcae_options))
  expect_silent(uninstall_gcae(gcae_options))
  expect_false(is_gcae_installed(gcae_options))
  unlink(gcae_folder, recursive = TRUE)
})
