#' Parse the `losses_from_project.csv` file
#'
#' Parse the `losses_from_project.csv` file
#' @inheritParams default_params_doc
#' @return a tibble with columns:
#'  * `n`: the epoch
#'  * `t`: the time this epoch took, in seconds
#' @author Richèl J.C. Bilderbeek
#' @export
parse_losses_from_project_file <- function(losses_from_project_filename) {
  if (!file.exists(losses_from_project_filename)) {
    stop(
      "'parse_losses_from_project_file' cannot find ",
      "'losses_from_project_filename'. \n",
      "losses_from_project_filename: ", losses_from_project_filename
    )
  }
  text <- readr::read_lines(file = losses_from_project_filename)
  text_matrix <- stringr::str_split(text, pattern = ",", simplify = TRUE)
  testthat::expect_equal(2, nrow(text_matrix))
  t <- tibble::tibble(
    epoch = as.numeric(text_matrix[1, ]),
    losses_from_project = as.numeric(text_matrix[2, ])
  )
  t
}
