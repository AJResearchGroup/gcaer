#' Calculate the normalized mean squared error through time
#' from the phenotype predictions
#'
#' Calculate the normalized mean squared error through time
#' (see \link{calc_nmse_from_identity_line})
#' from the phenotype predictions,
#' @inheritParams default_params_doc
#' @return a table with the normalized mean squared error through time
#' @seealso use \link{calc_nmse_from_identity_line} to calculate the
#' normalized mean square error from the identity line for a point in time
#' @examples
#' calc_nmse_from_phenotype_predictions(
#'   phenotype_predictions_table = create_test_phenotype_predictions_table()
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
calc_nmse_from_phenotype_predictions <- function(phenotype_predictions_table) { # nolint indeed a long function name
  gcaer::check_phenotype_predictions_table(phenotype_predictions_table)

  epoch <- NULL; rm(epoch) # nolint, fixes warning: no visible binding for global variable
  true_phenotype <- NULL; rm(true_phenotype) # nolint, fixes warning: no visible binding for global variable
  predicted_phenotype <- NULL; rm(predicted_phenotype) # nolint, fixes warning: no visible binding for global variable

  # Same as the version below, yet CRAN package-friendly
  # (if you know how to do this without changing the user environment,
  # please let me know)
  #
  # phenotype_predictions_table %>%                                             # nolint indeed, this is code
  #   dplyr::group_by(epoch) %>%                                                # nolint indeed, this is code
  #   dplyr::summarise(                                                         # nolint indeed, this is code
  #     nmse = gcaer::calc_nmse_from_identity_line(                             # nolint indeed, this is code
  #       true_phenotype, predicted_phenotype                                   # nolint indeed, this is code
  #     )                                                                       # nolint indeed, this is code
  #   )                                                                         # nolint indeed, this is code
  dplyr::summarise(
    dplyr::group_by(
      phenotype_predictions_table,
      epoch
    ),
    nmse = gcaer::calc_nmse_from_identity_line(
      true_phenotype, predicted_phenotype
    )
  )
}
