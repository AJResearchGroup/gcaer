#' Create a `scores_table` to be used in testing
#'
#' Create a `scores_table` to be used in testing
#' @return a `scores_table`
#' @examples
#' create_test_scores_table()
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_scores_table <- function() {
  first_epoch <- tibble::tibble(
    score = "f1_score_3",
    value = 0.12,
    epoch = 1000
  )
  second_epoch <- tibble::tibble(
    score = "f1_score_3",
    value = 0.23,
    epoch = 2000
  )
  dplyr::bind_rows(first_epoch, second_epoch)
}
