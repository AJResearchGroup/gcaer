create_phenotype_predictions_through_time_png <- function(
  phenotype_predictions_table,
  png_filename
) {
  gcaer::check_phenotype_predictions_table(phenotype_predictions_table)
  gcaer::check_png_filename(png_filename)
  phenotype_predictions_table$color <- as.factor(phenotype_predictions_table$epoch)
  phenotype_predictions_table$size <- phenotype_predictions_table$epoch
  phenotype_predictions_table$size <- 10.0 * phenotype_predictions_table$size / max(phenotype_predictions_table$size)

  x_axis_min <- min(0.0, min(phenotype_predictions_table$true_phenotype))
  x_axis_max <- max(0.0, max(phenotype_predictions_table$true_phenotype))
  y_axis_min <- min(0.0, min(phenotype_predictions_table$predicted_phenotype))
  y_axis_max <- max(0.0, max(phenotype_predictions_table$predicted_phenotype))

  plot <- ggplot2::ggplot(
    phenotype_predictions_table,
    ggplot2::aes(true_phenotype, predicted_phenotype, col = color, size = size)
  ) + ggplot2::geom_point() +
    ggplot2::scale_x_continuous(limits = c(x_axis_min, x_axis_max)) +
    ggplot2::scale_y_continuous(limits = c(y_axis_min, y_axis_max)) +
    ggplot2::geom_abline(intercept = 0, slope = 1, lty = "dashed") +
    gcaer::get_gcaer_theme() +
    ggplot2::theme(legend.position = "none")

  plot
  ggplot2::ggsave(filename = png_filename, width = 7, height = 7)
  plot
}
