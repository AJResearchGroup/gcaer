#' Create a PNG file of the losses from training through time,
#' based on the validation set.
#'
#' Create a PNG file of the losses from training through time,
#' based on the validation set.
#' @inheritParams default_params_doc
#' @return a \link[ggplot2]{ggplot2}
#' @author Richèl J.C. Bilderbeek
#' @export
create_losses_from_train_v_through_time_png <- function( # nolint indeed a long function name
  losses_from_train_v_table,
  png_filename
) {
  epoch <- NULL; rm(epoch) # nolint, fixes warning: no visible binding for global variable
  losses_from_train_v <- NULL; rm(losses_from_train_v) # nolint, fixes warning: no visible binding for global variable


  gcaer::check_losses_from_train_v_table(losses_from_train_v_table)
  gcaer::check_png_filename(png_filename)
  plot <- ggplot2::ggplot(
    losses_from_train_v_table,
    ggplot2::aes(epoch, losses_from_train_v)
  ) + ggplot2::geom_line() +
    ggplot2::scale_x_continuous(limits = c(0, NA)) +
    ggplot2::scale_y_continuous(limits = c(0, NA)) +
    gcaer::get_gcaer_theme()
  plot
  ggplot2::ggsave(png_filename, width = 7, height = 7)
  plot
}
