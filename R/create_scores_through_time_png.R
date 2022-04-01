create_scores_through_time_png <- function(
  scores_table,
  png_filename
) {
  gcaer::check_scores_table(scores_table)
  gcaer::check_png_filename(png_filename)
  plot <- ggplot2::ggplot(
    scores_table,
    ggplot2::aes(epoch, value, color = score)
  ) +
    ggplot2::geom_point() +
    gcaer::get_gcaer_theme()

  plot
}
