#' Create a `phenotype_predictions_table` to be used in testing
#'
#' Create a `phenotype_predictions_table` to be used in testing
#' @inheritParams default_params_doc
#' @return a `phenotype_predictions_table`
#' @examples
#' create_test_phenotype_predictions_table()
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_phenotype_predictions_table <- function() {
  tibble::tibble(
    FID = "A",
    IID = seq(1, 5),
    true_phenotype = seq(11, 15),
    predicted_phenotype = seq(11, 15),
    epoch = 1000
  )
}
