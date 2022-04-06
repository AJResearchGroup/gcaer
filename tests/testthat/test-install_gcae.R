test_that("un- or install", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (plinkr::get_os() == "win") return()
  gcae_options <- create_gcae_options(
    gcae_folder = get_gcaer_tempfilename(),
    ormr_folder_name = "python3"
  )
  if (is_gcae_installed(gcae_options)) return()
  expect_false(is_gcae_installed(gcae_options))
  # Cannot do expect_silent, as 'reticulate::py_install'
  # will always produce output
  install_gcae(
    gcae_options = gcae_options,
    verbose = TRUE
  )
  expect_true(is_gcae_installed(gcae_options))
  expect_silent(uninstall_gcae(gcae_options))
  expect_false(is_gcae_installed(gcae_options))
  unlink(gcae_options$gcae_folder, recursive = TRUE)
})

test_that("Install twice must give a proper error message", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (plinkr::get_os() == "win") return()
  if (!is_gcae_installed()) return()

  expect_error(
    install_gcae(gcae_options = create_gcae_options()),
    "Cannot install GCAE when it is already installed"
  )
})
