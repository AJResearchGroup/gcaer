test_that("un- or install in temp gcae folder", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (plinkr::get_os() == "win") return()

  gcae_options <- create_gcae_options(gcae_folder = get_gcaer_tempfilename())
  expect_false(is_gcae_installed(gcae_options))
  install_gcae(gcae_options) # reticulate::py_install will always produce output
  expect_true(is_gcae_installed(gcae_options))
  expect_silent(uninstall_gcae(gcae_options))
  expect_false(is_gcae_installed(gcae_options))
  unlink(gcae_folder, recursive = TRUE)
})

test_that("Install twice must give a proper error message", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (plinkr::get_os() == "win") return()
  if (!is_gcae_installed(gcae_options = create_gcae_options())) return()
  expect_error(
    install_gcae(gcae_options = create_gcae_options()),
    "Cannot install GCAE when it is already installed"
  )
})
