#' Read a `nmse_in_time_table` from file
#'
#' Read a `nmse_in_time_table` from file
#' @inheritParams default_params_doc
#' @return the `nmse_in_time_table`,
#' as checked by \link{check_nmse_in_time_table}
#' @author Richèl J.C. Bilderbeek
#' @export
read_nmse_in_time_file <- function(nmse_in_time_filename) {
  gcaer::check_csv_filename(nmse_in_time_filename)
  testthat::expect_true(file.exists(nmse_in_time_filename))
  nmse_in_time_table <- readr::read_csv(
    nmse_in_time_filename,
    col_types = readr::cols(
      epoch = readr::col_double(),
      genotype_concordance = readr::col_double()
    )
  )
  gcaer::check_nmse_in_time_table(nmse_in_time_table)
  nmse_in_time_table
}
