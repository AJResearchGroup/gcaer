#' Plot the train times, from file
#'
#' Plot the train times, from file
#' @inheritParams default_params_doc
#' @return the filename where the plot is stored
#' @author Richèl J.C. Bilderbeek
#' @export
plot_train_times_from_file <- function(
  train_times_filename,
  png_filename = stringr::str_replace(train_times_filename, ".csv$", ".png") # nolint indeed a long line
) {
  train_times_table <- gcaer::read_train_times_file(train_times_filename)
  gcaer::create_train_times_through_time_png(
    train_times_table = train_times_table,
    png_filename = png_filename
  )
}
