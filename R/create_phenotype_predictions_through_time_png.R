#' Create a PNG file of the phenotypic predictions through time
#'
#' Create a PNG file of the phenotypic predictions through time
#' @inheritParams default_params_doc
#' @return a \link[ggplot2]{ggplot2}
#' @author Richèl J.C. Bilderbeek
#' @export
create_phenotype_predictions_through_time_png <- function( # nolint indeed a long function name
  phenotype_predictions_table,
  png_filename
) {
  epoch <- NULL; rm(epoch) # nolint, fixes warning: no visible binding for global variable
  true_phenotype <- NULL; rm(true_phenotype) # nolint, fixes warning: no visible binding for global variable
  predicted_phenotype <- NULL; rm(predicted_phenotype) # nolint, fixes warning: no visible binding for global variable
  color <- NULL; rm(color) # nolint, fixes warning: no visible binding for global variable
  size <- NULL; rm(size) # nolint, fixes warning: no visible binding for global variable

  gcaer::check_phenotype_predictions_table(phenotype_predictions_table)
  gcaer::check_png_filename(png_filename)

  if ("plot only the last" == "plot only the last") {
    phenotype_predictions_table <- dplyr::filter(
      phenotype_predictions_table,
      epoch == max(phenotype_predictions_table$epoch)
    )
    phenotype_predictions_table$color <- "black"
    phenotype_predictions_table$size <- 10.0
  } else {
    phenotype_predictions_table$color <- as.factor(
      phenotype_predictions_table$epoch
    )
    phenotype_predictions_table$size <- phenotype_predictions_table$epoch
    phenotype_predictions_table$size <- 10.0 *
      phenotype_predictions_table$size /
      max(phenotype_predictions_table$size)
  }

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
