test_that("use", {
  skip("#18")
  phenotype_predictions_table <- create_test_phenotype_predictions_table()
  nmse_in_time_table <- calc_nmse_from_phenotype_predictions(
    phenotype_predictions_table
  )
  expect_true(tibble::is_tibble(nmse_in_time_table))
  expect_true("nmse" %in% names(nmse_in_time_table))
  expect_true("epoch" %in% names(nmse_in_time_table))
})
