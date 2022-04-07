#' Read a `scores_per_pop_table` from file
#'
#' Read a `scores_per_pop_table` from file
#' @inheritParams default_params_doc
#' @return the `scores_per_pop_table`,
#' as checked by \link{check_scores_per_pop_table}
#' @author Richèl J.C. Bilderbeek
#' @export
read_scores_per_pop_file <- function(scores_per_pop_filename) {
  gcaer::check_csv_filename(scores_per_pop_filename)
  testthat::expect_true(file.exists(scores_per_pop_filename))
  scores_per_pop_table <- readr::read_csv(
    scores_per_pop_filename,
    col_types = readr::cols(
      population = readr::col_character(),
      name = readr::col_character(),
      value = readr::col_double(),
      epoch = readr::col_double()
    )
  )
  gcaer::check_scores_per_pop_table(scores_per_pop_table)
  scores_per_pop_table
}
