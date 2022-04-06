#' Check if the `phenotype_predictions_table` is valid
#'
#' Check if the `phenotype_predictions_table` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing.
#' Will \link{stop} if `phenotype_predictions_table` is invalid.
#' @examples
#' phenotype_predictions_table <- create_test_phenotype_predictions_table()
#' check_phenotype_predictions_table(phenotype_predictions_table)
#' @author Richèl J.C. Bilderbeek
#' @export
check_phenotype_predictions_table <- function(phenotype_predictions_table) { # nolint indeed a long function name
  testthat::expect_true(tibble::is_tibble(phenotype_predictions_table))
  testthat::expect_true("FID" %in% names(phenotype_predictions_table))
  testthat::expect_true("IID" %in% names(phenotype_predictions_table))
  testthat::expect_true(
    "true_phenotype" %in% names(phenotype_predictions_table)
  )
  testthat::expect_true(
    "predicted_phenotype" %in% names(phenotype_predictions_table)
  )
  testthat::expect_true("epoch" %in% names(phenotype_predictions_table))
  invisible(phenotype_predictions_table)
}
