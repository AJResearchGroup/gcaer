test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_gcae_installed()) return()
  expect_silent(check_pip_is_installed())
})

test_that("use", {
  gcae_options <- create_gcae_options(gcae_folder = get_gcaer_tempfilename())
  expect_error(
    check_pip_is_installed(gcae_options = gcae_options),
    "'conda_binary_path' not found at"
  )
  if ()
  install_miniconda(
    miniconda_path = get_miniconda_path(gcae_options = gcae_options)
  )
  expect_error(
    check_pip_is_installed(gcae_options = gcae_options),
    "XXX"
  )
})

