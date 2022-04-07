#' Plot the losses from training in time, for the validation set, from file
#'
#' Plot the losses from training in time, for the validation set, from file
#' @inheritParams default_params_doc
#' @return the filename where the plot is stored
#' @author Richèl J.C. Bilderbeek
#' @export
plot_losses_from_train_v_from_file <- function(
  losses_from_train_v_filename,
  png_filename = stringr::str_replace(losses_from_train_v_filename, ".csv$", ".png") # nolint indeed a long line

) {
  losses_from_train_v_table <- gcaer::read_losses_from_train_v_filename(
    losses_from_train_v_filename
  )
  gcaer::create_losses_from_train_v_through_time_png(
    losses_from_train_v_table = losses_from_train_v_table,
    png_filename = png_filename
  )
}
