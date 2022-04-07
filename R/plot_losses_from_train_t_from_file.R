#' Plot the losses from training in time, for the training set, from file
#'
#' Plot the losses from training in time, for the training set, from file
#' @inheritParams default_params_doc
#' @return the filename where the plot is stored
#' @author Richèl J.C. Bilderbeek
#' @export
plot_losses_from_train_t_from_file <- function(
  losses_from_train_t_filename,
  png_filename
) {
  losses_from_train_t_table <- gcaer::read_losses_from_train_t_file(
    losses_from_train_t_filename
  )
  gcaer::create_losses_from_train_t_through_time_png(
    losses_from_train_t_table = losses_from_train_t_table,
    png_filename = png_filename
  )
}
