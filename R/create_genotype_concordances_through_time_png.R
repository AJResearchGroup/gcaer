#' Create a PNG file of the genotype concordance through time
#'
#' Create a PNG file of the genotype concordance through time
#' @inheritParams default_params_doc
#' @return a \link[ggplot2]{ggplot2}
#' @author Richèl J.C. Bilderbeek
#' @export
create_genotype_concordances_through_time_png <- function(
  genotype_concordances_table,
  png_filename
) {
  epoch <- NULL; rm(epoch) # nolint, fixes warning: no visible binding for global variable
  genotype_concordance <- NULL; rm(genotype_concordance) # nolint, fixes warning: no visible binding for global variable

  gcaer::check_genotype_concordances_table(genotype_concordances_table)
  gcaer::check_png_filename(png_filename)
  plot <- ggplot2::ggplot(
    genotype_concordances_table,
    ggplot2::aes(epoch, genotype_concordance)
  ) +
    ggplot2::geom_line() +
    ggplot2::geom_point() +
    ggplot2::scale_y_continuous(name = "genotype concordance", limits = c(0, 1)) +
    gcaer::get_gcaer_theme()

  plot
  ggplot2::ggsave(png_filename, width = 7, height = 7)
  plot
}
