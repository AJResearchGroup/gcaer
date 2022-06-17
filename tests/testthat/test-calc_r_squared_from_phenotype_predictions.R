test_that("use", {
  phenotype_predictions_table <- create_test_phenotype_predictions_table()
  r_squared_in_time_table <- calc_r_squared_from_phenotype_predictions(
    phenotype_predictions_table
  )
  expect_true(tibble::is_tibble(r_squared_in_time_table))
  expect_true("r_squared" %in% names(r_squared_in_time_table))
  expect_true("epoch" %in% names(r_squared_in_time_table))
})
