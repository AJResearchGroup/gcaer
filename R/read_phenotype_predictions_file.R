#' Read a `phenotype_predictions_table` from file
#'
#' Read a `phenotype_predictions_table` from file
#' @inheritParams default_params_doc
#' @return the `phenotype_predictions_table`,
#' as checked by \link{check_phenotype_predictions_table}
#' @author Richèl J.C. Bilderbeek
#' @export
read_phenotype_predictions_file <- function(phenotype_predictions_filename) {
  gcaer::check_csv_filename(phenotype_predictions_filename)
  testthat::expect_true(file.exists(phenotype_predictions_filename))
  phenotype_predictions_table <- readr::read_csv(
    phenotype_predictions_filename,
    col_types = readr::cols(
      FID = readr::col_character(),
      IID = readr::col_character(),
      true_phenotype = readr::col_double(),
      predicted_phenotype = readr::col_double(),
      epoch = readr::col_double()
    )
  )
  gcaer::check_phenotype_predictions_table(phenotype_predictions_table)
  phenotype_predictions_table
}
