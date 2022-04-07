#' Plot the scores per population in time, from file
#'
#' Plot the scores per population in time, from file
#' @inheritParams default_params_doc
#' @return the filename where the plot is stored
#' @author Richèl J.C. Bilderbeek
#' @export
plot_scores_per_pop_from_file <- function(
  scores_per_pop_filename,
  png_filename = stringr::str_replace(scores_per_pop_filename, ".csv$", ".png")
) {
  scores_per_pop_table <- gcaer::read_scores_per_pop_file(
    scores_per_pop_filename
  )
  gcaer::create_scores_per_pop_through_time_png(
    scores_per_pop_table = scores_per_pop_table,
    png_filename = png_filename
  )
}
