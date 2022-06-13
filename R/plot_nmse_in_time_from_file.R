#' Plot the NMSE in time, from file
#'
#' Plot the NMSE in time, from file
#' @inheritParams default_params_doc
#' @return the filename where the plot is stored
#' @author Richèl J.C. Bilderbeek
#' @export
plot_nmse_in_time_from_file <- function(
  nmse_in_time_filename,
  png_filename
) {
  nmse_in_time_table <- gcaer::read_nmse_in_time_file(nmse_in_time_filename)
  gcaer::create_nmse_through_time_png(
    nmse_in_time_table = nmse_in_time_table,
    png_filename = png_filename
  )
}
