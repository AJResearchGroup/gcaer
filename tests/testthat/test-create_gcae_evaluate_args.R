test_that("use, with superpops", {
  gcae_setup <- create_test_gcae_setup(superpops = "superpops.txt")
  metrics <- "f1_score_3"
  epoch <- 100
  args <- create_gcae_evaluate_args(
    gcae_setup = gcae_setup,
    metrics = metrics,
    epoch = epoch
  )
  expect_equal(21, length(args))
})

test_that("use, without superpops", {
  gcae_setup <- create_test_gcae_setup()
  metrics <- "hull_error"
  epoch <- 100
  args <- create_gcae_evaluate_args(
    gcae_setup = gcae_setup,
    metrics = metrics,
    epoch = epoch
  )
  expect_equal(19, length(args))
})
