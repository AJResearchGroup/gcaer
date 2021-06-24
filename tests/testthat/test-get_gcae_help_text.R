test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_gcae_installed()) return()
  expect_silent(get_gcae_help_text())

  text <- get_gcae_help_text()
  expect_true(is.character(text))
  expect_true(length(text) > 3)
})