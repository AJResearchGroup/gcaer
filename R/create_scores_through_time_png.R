#' Create a PNG file of the F1 scores through time
#'
#' Create a PNG file of the F1 scores through time
#' @inheritParams default_params_doc
#' @return a \link[ggplot2]{ggplot2}
#' @author Richèl J.C. Bilderbeek
#' @export
create_scores_through_time_png <- function(
  scores_table,
  png_filename
) {
  epoch <- NULL; rm(epoch) # nolint, fixes warning: no visible binding for global variable
  value <- NULL; rm(value) # nolint, fixes warning: no visible binding for global variable
  score <- NULL; rm(score) # nolint, fixes warning: no visible binding for global variable

  gcaer::check_scores_table(scores_table)
  gcaer::check_png_filename(png_filename)
  scores_table$num_neighbours <- as.factor(
    as.numeric(stringr::str_replace(
        string = scores_table$score,
        pattern = "f1_score_",
        replacement = ""
      )
    )
  )
  plot <- ggplot2::ggplot(
    scores_table,
    ggplot2::aes(epoch, value, color = num_neighbours)
  ) +
    ggplot2::geom_line() +
    ggplot2::geom_point() +
    ggplot2::scale_y_continuous(name = "f1_score", limits = c(0, 1)) +
    gcaer::get_gcaer_theme()

  plot
  ggplot2::ggsave(png_filename, width = 7, height = 7)
  plot
}
