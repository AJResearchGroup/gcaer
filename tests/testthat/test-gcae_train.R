test_that("use", {
  # See test-gcae_workflow.R for the full GCAE workflow
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
})

test_that("abuse", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_script_fixed()) return()
  expect_error(
    gcae_train(
      gcae_setup = "nonsense"
    ),
    "'gcae_setup' must be a list"
  )
})
