#' Read a `score_per_pop_table` from file
#'
#' Read a `score_per_pop_table` from file
#' @inheritParams default_params_doc
#' @return the `score_per_pop_table`,
#' as checked by \link{check_score_per_pop_table}
#' @author Richèl J.C. Bilderbeek
#' @export
read_score_per_pop_file <- function(score_per_pop_filename) {
  gcaer::check_csv_filename(score_per_pop_filename)
  testthat::expect_true(file.exists(score_per_pop_filename))
  score_per_pop_table <- readr::read_csv(
    score_per_pop_filename,
    col_types = readr::cols(
      population = readr::col_character(),
      name = readr::col_character(),
      value = readr::col_double(),
      epoch = readr::col_double()
    )
  )
  gcaer::check_score_per_pop_table(score_per_pop_table)
  score_per_pop_table
}
