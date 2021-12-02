test_that("show help", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_installed()) return()
  expect_silent(
    text <- run_gcae(
      args = "--help"
    )
  )
  expect_true(
    any(
      stringr::str_detect(
        string = text,
        pattern = "GenoCAE"
      )
    )
  )
})

test_that("error", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_installed()) return()
  args <- c("--nonsense")
  skip("Not yet")
  expect_error(run_gcae(args), "Invalid command")
})
