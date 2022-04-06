#' Create a `genotype_concordances_table` to be used in testing
#'
#' Create a `genotype_concordances_table` to be used in testing
#' @inheritParams default_params_doc
#' @return a `genotype_concordances_table`
#' @examples
#' check_genotype_concordances_table(create_test_genotype_concordances_table())
#' @author Richèl J.C. Bilderbeek
#' @export
check_genotype_concordances_table <- function(genotype_concordances_table) { # nolint indeed a long function name
  testthat::expect_true(tibble::is_tibble(genotype_concordances_table))
  testthat::expect_true("epoch" %in% names(genotype_concordances_table))
  testthat::expect_true(
    "genotype_concordance" %in% names(genotype_concordances_table)
  )
  invisible(genotype_concordances_table)
}
