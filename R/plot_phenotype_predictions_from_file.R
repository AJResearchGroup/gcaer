#' Plot the phenotype predictions in time, from file
#'
#' Plot the phenotype predictions in time, from file
#' @inheritParams default_params_doc
#' @return the filename where the plot is stored
#' @author Richèl J.C. Bilderbeek
#' @export
plot_phenotype_predictions_from_file <- function(
  phenotype_predictions_filename,
  png_filename = stringr::str_replace(phenotype_predictions_filename, ".csv$", ".png") # nolint indeed a long line
) {
  phenotype_predictions_table <- gcaer::read_phenotype_predictions_file(
    phenotype_predictions_filename
  )
  gcaer::create_phenotype_predictions_through_time_png(
    phenotype_predictions_table = phenotype_predictions_table,
    png_filename = png_filename
  )
}
