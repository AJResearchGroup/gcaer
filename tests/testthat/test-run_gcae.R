test_that("show help", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_gcae_installed()) return()
  expect_silent(
    run_gcae(
      args = "--help",
    )
  )
})

test_that("error", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_gcae_installed()) return()
  args <- c(
    "--nonsense"
  )
  expect_error(
    run_gcae(args),
    "you should be able to copy-paste this"
  )
})
