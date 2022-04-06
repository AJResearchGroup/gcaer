#' Parse the `train_times.csv` file
#'
#' Parse the `train_times.csv` file
#' @inheritParams default_params_doc
#' @return a tibble with columns:
#'  * `n`: the epoch
#'  * `t`: the time this epoch took, in seconds
#' @author Richèl J.C. Bilderbeek
#' @export
parse_train_times_file <- function(train_times_filename) {
  testthat::expect_true(file.exists(train_times_filename))
  text <- readr::read_lines(file = train_times_filename)
  text_matrix <- stringr::str_split(text, pattern = ",", simplify = TRUE)
  nrow(text_matrix)
  ncol(text_matrix)
  t <- tibble::tibble(
    epoch = as.numeric(text_matrix[1, ]),
    train_time_sec = as.numeric(text_matrix[2, ])
  )
  t
}
