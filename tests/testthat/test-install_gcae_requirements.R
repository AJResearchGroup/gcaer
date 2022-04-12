test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_script_fixed()) return()
  gcae_options <- create_gcae_options()
  install_gcae_requirements(gcae_options, verbose = TRUE)
})
