test_that("use", {
  skip("#18")
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_installed()) return()

  do_full_experiment()
  expect_equal(2 * 2, 4)
})
