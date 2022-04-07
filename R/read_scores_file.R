#' Read a `scores_table` from file
#'
#' Read a `scores_table` from file
#' @inheritParams default_params_doc
#' @return the `scores_table`,
#' as checked by \link{check_scores_table}
#' @author Richèl J.C. Bilderbeek
#' @export
read_scores_file <- function(scores_filename) {
  gcaer::check_csv_filename(scores_filename)
  testthat::expect_true(file.exists(scores_filename))
  scores_table <- readr::read_csv(
    scores_filename,
    col_types = readr::cols(
      score = readr::col_character(),
      value = readr::col_double(),
      epoch = readr::col_double()
    )
  )
  gcaer::check_scores_table(scores_table)
  scores_table
}
