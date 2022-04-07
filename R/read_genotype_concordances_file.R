#' Read a `genotype_concordances_table` from file
#'
#' Read a `genotype_concordances_table` from file
#' @inheritParams default_params_doc
#' @return the `genotype_concordances_table`,
#' as checked by \link{check_genotype_concordances_table}
#' @author Richèl J.C. Bilderbeek
#' @export
read_genotype_concordances_file <- function(genotype_concordances_filename) { # nolint indeed a long function name
  gcaer::check_csv_filename(genotype_concordances_filename)
  testthat::expect_true(file.exists(genotype_concordances_filename))
  genotype_concordances_table <- readr::read_csv(
    genotype_concordances_filename,
    col_types = readr::cols(
      epoch = readr::col_double(),
      genotype_concordance = readr::col_double()
    )
  )
  gcaer::check_genotype_concordances_table(genotype_concordances_table)
  genotype_concordances_table
}
