test_that("show help", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_gcae_installed()) return()
  expect_silent(
    run_gcae(
      args = "--help"
    )
  )
})

test_that("error", {
  skip("https://github.com/kausmees/GenoCAE/issues/7")
  # GCAE does not give an error message in any way,
  # so gcaer cannot distinguish if input is invalid
  # or a valid request for the help message
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
