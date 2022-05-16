test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  # 'is_gcae_installed' is too slow
  if (has_cloned_gcae_repo()) {
    expect_silent(check_gcae_is_installed())
  }
})
