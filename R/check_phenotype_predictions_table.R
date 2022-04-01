check_phenotype_predictions_table <- function(phenotype_predictions_table) {
  testthat::expect_true(tibble::is_tibble(phenotype_predictions_table))
  testthat::expect_true("FID" %in% names(phenotype_predictions_table))
  testthat::expect_true("IID" %in% names(phenotype_predictions_table))
  testthat::expect_true("true_phenotype" %in% names(phenotype_predictions_table))
  testthat::expect_true("predicted_phenotype" %in% names(phenotype_predictions_table))
  testthat::expect_true("epoch" %in% names(phenotype_predictions_table))
}
