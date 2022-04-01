#' Get the `gcaer` theme
#'
#' Get the `gcaer` theme
#' @return a \link[ggplot2]{theme}
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcaer_theme <- function() {
  ggplot2::theme_bw() +
    ggplot2::theme(
      axis.line = ggplot2::element_line(colour = "black"),
      legend.key = ggplot2::element_blank(),
      panel.grid.major = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      panel.border = ggplot2::element_blank(),
      panel.background = ggplot2::element_blank(),
      strip.background = ggplot2::element_rect(
        colour = "white",
        fill = "#FFFFFF"
      ),
      text = ggplot2::element_text(size = 24)
    )
}
