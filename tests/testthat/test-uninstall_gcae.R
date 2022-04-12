test_that("install and uninstall", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_script_fixed()) return()
  gcae_options <- create_gcae_options(
    gcae_folder = get_gcaer_tempfilename()
  )
  expect_false(is_gcae_installed(gcae_options = gcae_options))
  install_gcae(gcae_options = gcae_options)
  expect_true(is_gcae_installed(gcae_options = gcae_options))
  uninstall_gcae(gcae_options = gcae_options)
  expect_false(is_gcae_installed(gcae_options = gcae_options))
})

test_that("abuse", {
  expect_error(
    uninstall_gcae("nonsense"),
    "must be a list"
  )
  expect_error(
    uninstall_gcae(
      gcae_options = create_gcae_options(gcae_folder = "abs.ent")
    ),
    "Cannot uninstall a GCAE version that is absent"
  )
})
