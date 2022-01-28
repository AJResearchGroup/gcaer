#' Check if the `gcae_input_data` is valid
#'
#' Check if the `gcae_input_data` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `gcae_input_data` is invalid.
#' @examples
#' gcae_input_filenames <- create_gcae_input_files_1()
#' gcae_input_data <- read_gcae_input_files(gcae_input_filenames)
#' check_gcae_input_data(gcae_input_data)
#'
#' # Clean up
#' file.remove(as.character(unlist(gcae_input_filenames)))
#' @author Richèl J.C. Bilderbeek
#' @export
check_gcae_input_data <- function(gcae_input_data) {
  testthat::expect_true(is.list(gcae_input_data))
  testthat::expect_true("bed_table" %in% names(gcae_input_data))
  testthat::expect_true("bim_table" %in% names(gcae_input_data))
  testthat::expect_true("fam_table" %in% names(gcae_input_data))
  testthat::expect_true("phe_table" %in% names(gcae_input_data))
  testthat::expect_true("labels_table" %in% names(gcae_input_data))
  plinkr::check_bed_table(gcae_input_data$bed_table)
  plinkr::check_bim_table(gcae_input_data$bim_table)
  plinkr::check_fam_table(gcae_input_data$fam_table)
  plinkr::check_phe_table(gcae_input_data$phe_table)
  gcaer::check_labels_table(gcae_input_data$labels_table)

  n_snps_in_bed_table <- nrow(gcae_input_data$bed_table)
  n_snps_in_bim_table <- nrow(gcae_input_data$bim_table)

  n_individuals_in_bed_table <- ncol(gcae_input_data$bed_table)
  n_individuals_in_fam_table <- nrow(gcae_input_data$fam_table)
  expect_equal(n_individuals_in_bed_table, n_individuals_in_fam_table)

  n_snps <- 1
  n_individuals <- 1000
  expect_equal(n_snps_in_bim_table, n_snps_in_bed_table)


  expect_true(all(gcae_input_data$labels_table$super_population == "Global"))
  expect_true(all(gcae_input_data$labels_table$population %in% LETTERS[1:3]))

  # The same format as GCAE
  expect_true(all(gcae_input_data$phe_table$FID %in% LETTERS[1:3]))
  # All FID and IID combinations must be unique
  expect_equal(
    nrow(gcae_input_data$phe_table),
    nrow(dplyr::distinct(dplyr::select(gcae_input_data$phe_table, FID, IID)))
  )
  expect_true(all(gcae_input_data$phe_table$FID %in% LETTERS[1:3]))

  expect_equal(
    gcae_input_data$phe_table$FID,
    gcae_input_data$fam_table$fam
  )
  expect_equal(
    as.character(gcae_input_data$phe_table$IID),
    gcae_input_data$fam_table$id
  )

}
