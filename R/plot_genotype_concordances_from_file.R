#' Plot the genotype concordances in time, from file
#'
#' Plot the genotype concordances in time, from file
#' @inheritParams default_params_doc
#' @return the filename where the plot is stored
#' @author Richèl J.C. Bilderbeek
#' @export
plot_genotype_concordances_from_file <- function(
  genotype_concordances_filename,
  png_filename
) {
  genotype_concordances_table <- gcaer::read_genotype_concordances_file(
    genotype_concordances_filename
  )
    gcaer::create_genotype_concordances_through_time_png(
    genotype_concordances_table = genotype_concordances_table,
    png_filename = png_filename
  )
}
