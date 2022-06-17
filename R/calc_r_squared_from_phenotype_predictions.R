#' Calculate the `r_squared` through time
#' from the phenotype predictions
#'
#' Calculate the `r_squared` through time
#' from the phenotype predictions,
#' @inheritParams default_params_doc
#' @return a table with the `r_squared` through time
#' @examples
#' calc_r_squared_from_phenotype_predictions(
#'   phenotype_predictions_table = create_test_phenotype_predictions_table()
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
calc_r_squared_from_phenotype_predictions <- function(phenotype_predictions_table) { # nolint indeed a long function name
  gcaer::check_phenotype_predictions_table(phenotype_predictions_table)

  epoch <- NULL; rm(epoch) # nolint, fixes warning: no visible binding for global variable
  true_phenotype <- NULL; rm(true_phenotype) # nolint, fixes warning: no visible binding for global variable
  predicted_phenotype <- NULL; rm(predicted_phenotype) # nolint, fixes warning: no visible binding for global variable

  dplyr::summarise(
    dplyr::group_by(
      phenotype_predictions_table,
      epoch
    ),
    r_squared = gcaer::calc_r_squared(
      true_phenotype, predicted_phenotype
    )
  )
}
