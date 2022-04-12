test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_script_fixed()) return()

  expect_message(get_gcae_help_text(verbose = TRUE))

  text <- get_gcae_help_text()
  text <- get_gcae_help_text(verbose = TRUE)
  expect_true(is.character(text))
  expect_true(length(text) > 3)
})
