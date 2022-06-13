#' Create a PNG file of the `r_squared` through time
#'
#' Create a PNG file of the `r_squared` through time
#' @inheritParams default_params_doc
#' @return a \link[ggplot2]{ggplot2}
#' @author Richèl J.C. Bilderbeek
#' @export
create_r_squared_through_time_png <- function( # nolint indeed a long function name
  r_squared_in_time_table,
  png_filename
) {
  epoch <- NULL; rm(epoch) # nolint, fixes warning: no visible binding for global variable
  r_squared <- NULL; rm(r_squared) # nolint, fixes warning: no visible binding for global variable

  gcaer::check_r_squared_in_time_table(r_squared_in_time_table)
  gcaer::check_png_filename(png_filename)
  plot <- ggplot2::ggplot(
    r_squared_in_time_table,
    ggplot2::aes(epoch, r_squared)
  ) + ggplot2::geom_line() +
    ggplot2::scale_x_continuous(limits = c(0, NA)) +
    ggplot2::scale_y_continuous(limits = c(0, NA)) +
    gcaer::get_gcaer_theme()
  plot
  ggplot2::ggsave(png_filename, width = 7, height = 7)
  plot
}
