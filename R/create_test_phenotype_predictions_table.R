#' Create a `phenotype_predictions_table` to be used in testing
#'
#' Create a `phenotype_predictions_table` to be used in testing
#' @return a `phenotype_predictions_table`
#' @examples
#' create_test_phenotype_predictions_table()
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_phenotype_predictions_table <- function() {
  true_phenotype <- seq(11, 15)
  first_epoch <- tibble::tibble(
    FID = "A",
    IID = seq(1, 5),
    true_phenotype = true_phenotype,
    predicted_phenotype = true_phenotype + (1.0 * seq(1, 5)), # Add noise
    epoch = 1000
  )
  second_epoch <- first_epoch
  second_epoch$epoch <- 2000
  second_epoch$predicted_phenotype <- true_phenotype + (0.5 * seq(1, 5))
  dplyr::bind_rows(first_epoch, second_epoch)
}
