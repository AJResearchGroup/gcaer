#' Create a GIF file of the phenotype predictions through time
#'
#' Create a GIF file of the phenotype predictions through time
#' @inheritParams default_params_doc
#' @return the result of \link[gganimate]{animate}
#' @author Richèl J.C. Bilderbeek
#' @export
create_phenotype_prediction_quality_png <- function(
  phenotype_predictions_table,
  png_filename
) {
  true_phenotype <- NULL; rm(true_phenotype) # nolint, fixes warning: no visible binding for global variable
  predicted_phenotype <- NULL; rm(predicted_phenotype) # nolint, fixes warning: no visible binding for global variable
  FID <- NULL; rm(FID) # nolint, fixes warning: no visible binding for global variable

  gcaer::check_phenotype_predictions_table(phenotype_predictions_table)
  gcaer::check_png_filename(png_filename)

  x_axis_min <- min(0.0, min(phenotype_predictions_table$true_phenotype))
  x_axis_max <- max(0.0, max(phenotype_predictions_table$true_phenotype))
  y_axis_min <- min(0.0, min(phenotype_predictions_table$predicted_phenotype))
  y_axis_max <- max(0.0, max(phenotype_predictions_table$predicted_phenotype))

  last_epoch <- max(phenotype_predictions_table$epoch)

  plot <- ggplot2::ggplot(
    phenotype_predictions_table[
      phenotype_predictions_table$epoch == last_epoch,
    ],
    ggplot2::aes(true_phenotype, predicted_phenotype, color = FID)
  ) +
    ggplot2::geom_point() +
    ggplot2::geom_abline(ggplot2::aes(slope = 1, intercept = 0), lty = "dashed") +
    ggplot2::scale_x_continuous(limits = c(x_axis_min, x_axis_max)) +
    ggplot2::scale_y_continuous(limits = c(y_axis_min, y_axis_max)) +
    gcaer::get_gcaer_theme()

  plot

  ggplot2::ggsave(filename = png_filename, width = 7, height = 7)

  plot
}
