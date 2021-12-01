test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_installed()) return()
  expect_silent(get_gcae_version())
  text <- get_gcae_version()
  expect_true(is.character(text))
  expect_true(length(text) == 1)
})
