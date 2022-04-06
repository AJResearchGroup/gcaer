#' Create a `scores_per_pop_table` to be used in testing
#'
#' Create a `scores_per_pop_table` to be used in testing
#' @return the parameters for a GCAE experiment
#' @examples
#' check_scores_per_pop_table(create_test_scores_per_pop_table())
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_scores_per_pop_table <- function() { # nolint indeed a long function name
  tibble::tibble(
    population = "A",
    name = c("f1_score_3", "f1_score_5"),
    value = c(0.1, 0.2),
    epoch = 1000
  )
}
