#' Plot the `r_squared` in time, from file
#'
#' Plot the `r_squared` in time, from file
#' @inheritParams default_params_doc
#' @return the filename where the plot is stored
#' @author Richèl J.C. Bilderbeek
#' @export
plot_r_squared_in_time_from_file <- function(
  r_squared_in_time_filename,
  png_filename
) {
  r_squared_in_time_table <- gcaer::read_r_squared_in_time_file(
    r_squared_in_time_filename
  )
  gcaer::create_r_squared_through_time_png(
    r_squared_in_time_table = r_squared_in_time_table,
    png_filename = png_filename
  )
}
