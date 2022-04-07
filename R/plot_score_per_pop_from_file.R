#' Plot the scores per population in time, from file
#'
#' Plot the scores per population in time, from file
#' @inheritParams default_params_doc
#' @return the filename where the plot is stored
#' @author Richèl J.C. Bilderbeek
#' @export
plot_score_per_pop_from_file <- function(
  score_per_pop_filename,
  png_filename
) {
  score_per_pop_table <- gcaer::read_score_per_pop_file(
    score_per_pop_filename
  )
  gcaer::create_score_per_pop_through_time_png(
    score_per_pop_table = score_per_pop_table,
    png_filename = png_filename
  )
}
