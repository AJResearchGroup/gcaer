#' Create a PNG file of the NMSE through time
#'
#' Create a PNG file of the NMSE through time
#' @inheritParams default_params_doc
#' @return a \link[ggplot2]{ggplot2}
#' @author Richèl J.C. Bilderbeek
#' @export
create_losses_from_nmse_through_time_png <- function( # nolint indeed a long function name
  nmse_in_time_table,
  png_filename
) {
  epoch <- NULL; rm(epoch) # nolint, fixes warning: no visible binding for global variable
  nmse <- NULL; rm(nmse) # nolint, fixes warning: no visible binding for global variable

  gcaer::check_nmse_in_time_table(nmse_in_time_table)
  gcaer::check_png_filename(png_filename)
  plot <- ggplot2::ggplot(
    nmse_in_time_table,
    ggplot2::aes(epoch, nmse)
  ) + ggplot2::geom_line() +
    ggplot2::scale_x_continuous(limits = c(0, NA)) +
    ggplot2::scale_y_continuous(limits = c(0, NA)) +
    gcaer::get_gcaer_theme()
  plot
  ggplot2::ggsave(png_filename, width = 7, height = 7)
  plot
}
