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
  expect_error(
    create_gcae_evaluate_args(
      gcae_setup = create_test_gcae_setup(
        superpops = ""
      ),
      metrics = "f1_score_3",
      epoch = 100
    ),
    "To run GCAE's 'evaluate' function, one needs a file with labels"
  )
})

test_that("use, without pheno_model_id", {
  expect_silent(
    check_gcae_args(
      create_gcae_evaluate_args(
        gcae_setup = create_test_gcae_setup(
          pheno_model_id = ""
        ),
        metrics = "f1_score_3",
        epoch = 100
      )
    )
  )
})
