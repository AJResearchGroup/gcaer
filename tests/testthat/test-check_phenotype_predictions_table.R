test_that("use", {
  phenotype_predictions_table <- create_test_phenotype_predictions_table()
  expect_silent(check_phenotype_predictions_table(phenotype_predictions_table))
})

test_that("abuse", {
  expect_error(
    check_phenotype_predictions_table(phenotype_predictions_table = "hello"),
    "'phenotype_predictions_table' must be a 'tibble'"
  )
})
