#' Plot the F1 scores in time, from file
#'
#' Plot the F1 scores in time, from file
#' @inheritParams default_params_doc
#' @return the filename where the plot is stored
#' @author Richèl J.C. Bilderbeek
#' @export
plot_scores_from_file <- function(
  scores_filename,
  png_filename
) {
  scores_table <- gcaer::read_scores_file(scores_filename)
  gcaer::create_scores_through_time_png(
    scores_table = scores_table,
    png_filename = png_filename
  )
}
