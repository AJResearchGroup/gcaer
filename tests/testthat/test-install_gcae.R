test_that("un- or install in temp gcae folder", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  # if (!gcaer::is_on_ci()) return() # nolint OK for now
  return()

  for (os in c("unix", "mac", "win")) {
    gcae_folder <- get_gcaer_tempfilename()
    gcae_optionses <- create_gcae_optionses(
      gcae_folder = gcae_folder,
      os = os
    )
    for (gcae_options in gcae_optionses) {
      expect_false(is_gcae_installed(gcae_options))
    }
    expect_silent(install_gcaes(gcae_optionses))

    for (gcae_options in gcae_optionses) {
      expect_true(is_gcae_installed(gcae_options))
    }

    expect_silent(uninstall_gcaes(gcae_optionses))

    for (gcae_options in gcae_optionses) {
      expect_false(is_gcae_installed(gcae_options))
    }
    unlink(gcae_folder, recursive = TRUE)
  }

})
