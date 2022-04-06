#' Create a `genotype_concordances_table` to be used in testing
#'
#' Create a `genotype_concordances_table` to be used in testing
#' @return a `genotype_concordances_table`
#' @examples
#' create_test_genotype_concordances_table()
#' check_genotype_concordances_table(create_test_genotype_concordances_table())
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_genotype_concordances_table <- function() { # nolint indeed a long function name
  tibble::tibble(
    epoch = seq(1, 10),
    genotype_concordance = seq(0.01, 0.1, by = 0.01)
  )
}
