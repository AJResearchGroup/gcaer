test_that("perfect predictions", {
  phenotype_predictions_table <- create_test_phenotype_predictions_table()
  phenotype_predictions_table$predicted_phenotype <-
    phenotype_predictions_table$true_phenotype
  nmse_in_time_table <- calc_nmse_from_phenotype_predictions(
    phenotype_predictions_table
  )
  expect_true(tibble::is_tibble(nmse_in_time_table))
  expect_true("nmse" %in% names(nmse_in_time_table))
  expect_true("epoch" %in% names(nmse_in_time_table))
  expect_true(all(nmse_in_time_table$nmse == 0))
})

test_that("use", {
  phenotype_predictions_table <- create_test_phenotype_predictions_table()
  nmse_in_time_table <- calc_nmse_from_phenotype_predictions(
    phenotype_predictions_table
  )
  expect_true(tibble::is_tibble(nmse_in_time_table))
  expect_true("nmse" %in% names(nmse_in_time_table))
  expect_true("epoch" %in% names(nmse_in_time_table))
})

test_that("use", {
  phenotype_predictions_table <- create_test_phenotype_predictions_table()

  phenotype_predictions_table$true_phenotype <- seq(from = -1, to = 1, length.out = nrow(phenotype_predictions_table))
  phenotype_predictions_table$predicted_phenotype <-
    phenotype_predictions_table$true_phenotype + 1

  nmse_in_time_table <- calc_nmse_from_phenotype_predictions(
    phenotype_predictions_table
  )
  nmse_in_time_table
  expect_true(tibble::is_tibble(nmse_in_time_table))
  expect_true("nmse" %in% names(nmse_in_time_table))
  expect_true("epoch" %in% names(nmse_in_time_table))
})
