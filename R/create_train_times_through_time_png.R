#' Create a PNG file of the training times through time
#'
#' Create a PNG file of the training times through time
#' @inheritParams default_params_doc
#' @return a \link[ggplot2]{ggplot2}
#' @author Richèl J.C. Bilderbeek
#' @export
create_train_times_through_time_png <- function( # nolint indeed a long function name
  train_times_table,
  png_filename
) {
  gcaer::check_train_times_table(train_times_table)
  gcaer::check_png_filename(png_filename)
  plot <- ggplot2::ggplot(
    train_times_table,
    ggplot2::aes(epoch, train_time_sec)
  ) + ggplot2::geom_line() +
    ggplot2::scale_y_continuous(limits = c(0, NA)) +
    gcaer::get_gcaer_theme()
  plot
  ggplot2::ggsave(png_filename, width = 7, height = 7)
  plot
}
