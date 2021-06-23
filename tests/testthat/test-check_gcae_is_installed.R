test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (is_gcae_installed()) {
    expect_silent(check_gcae_is_installed())
  }
})
