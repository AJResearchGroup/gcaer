test_that("use", {
  # See test-gcae_workflow.R for the full GCAE workflow
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test

  expect_error(gcae_plot(gcae_setup = "nonsense"))

})
