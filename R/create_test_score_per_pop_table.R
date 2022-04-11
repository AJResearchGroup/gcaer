#' Create a `score_per_pop_table` to be used in testing
#'
#' Create a `score_per_pop_table` to be used in testing
#' @return the parameters for a GCAE experiment
#' @examples
#' check_score_per_pop_table(create_test_score_per_pop_table())
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_score_per_pop_table <- function() { # nolint indeed a long function name
  first_epoch <- tibble::tibble(
    population = "A",
    name = c("f1_score_3", "f1_score_5"),
    value = c(0.1, 0.2),
    epoch = 1000
  )
  second_epoch <- tibble::tibble(
    population = "A",
    name = c("f1_score_3", "f1_score_5"),
    value = c(0.3, 0.7),
    epoch = 2000
  )
  dplyr::bind_rows(first_epoch, second_epoch)
}
