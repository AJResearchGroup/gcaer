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
  if (n_snps_in_bed_table != n_snps_in_bim_table) {
    stop(
      "Must have an equal amount of SNPs in .bed and .bim table. \n",
      "Number of SNPs in .bed table: ", n_snps_in_bed_table, " \n",
      "Number of SNPs in .bim table: ", n_snps_in_bim_table
    )
  }

  snps_names_in_bed_table <- rownames(gcae_input_data$bed_table)
  snps_names_in_bim_table <- gcae_input_data$bim_table$id
  if (snps_names_in_bed_table != snps_names_in_bim_table) {
    stop(
      "SNP names in .bed and .bim table must match \n",
      "SNP names in .bed table: ", snps_names_in_bed_table, " \n",
      "SNP names in .bim table: ", snps_names_in_bim_table
    )
  }

  n_individuals_in_bed_table <- ncol(gcae_input_data$bed_table)
  n_individuals_in_fam_table <- nrow(gcae_input_data$fam_table)
  n_individuals_in_phe_table <- nrow(gcae_input_data$phe_table)
  if (n_individuals_in_bed_table != n_individuals_in_fam_table) {
    stop(
      "Must have an equal amount of individuals in .bed and .fam table. \n",
      "Number of individuals in .bed table: ",
        n_individuals_in_bed_table, " \n",
      "Number of individuals in .fam table: ", n_individuals_in_fam_table
    )
  }
  if (n_individuals_in_bed_table != n_individuals_in_phe_table) {
    stop(
      "Must have an equal amount of individuals in .bed and .phe table. \n",
      "Number of individuals in .bed table: ",
      n_individuals_in_bed_table, " \n",
      "Number of individuals in .phe table: ", n_individuals_in_phe_table
    )
  }

  # All FID and IID combinations must be unique
  unique_phe_table <- dplyr::distinct(
    dplyr::select(gcae_input_data$phe_table, FID, IID)
  )
  n_unique_individuals_in_phe_table <- nrow(unique_phe_table) # nolint indeed a long variable name
  if (n_unique_individuals_in_phe_table != n_unique_individuals_in_phe_table) {
    stop("All individuals in the .phe table must be unique")
  }

  if (!all(gcae_input_data$phe_table$FID == gcae_input_data$fam_table$fam)) {
    stop(
      "The family IDs in the .phe and .fam tables must match. \n",
      "First .phe table FIDs: ",
        paste0(head(gcae_input_data$phe_table$FID), collapse = ", "), " \n",
      "First .fam table family IDs (i.e. the 'fam' column)): ",
      paste0(head(gcae_input_data$fam_table$fam), collapse = ", "), " \n"
    )
  }

  if (!all(gcae_input_data$phe_table$IID == gcae_input_data$fam_table$id)) {
    stop(
      "The within-family IDs in the .phe and .fam tables must match. \n",
      "First .phe table IIDs: ",
      paste0(head(gcae_input_data$phe_table$IID), collapse = ", "), " \n",
      "First .fam table within-family IDs (i.e. the 'id' column)): ",
      paste0(head(gcae_input_data$fam_table$id), collapse = ", "), " \n"
    )
  }

  if (
    !all(
      gcae_input_data$fam_table$fam %in%
        gcae_input_data$labels_table$population
    )
  ) {
    stop(
      "All family IDs must be within the labels table. \n",
      "First labels table's family IDs (i.e. the 'population' column)): ",
      paste0(
        head(gcae_input_data$labels_table$population),
        collapse = ", "
      ), " \n",
      "First .fam table family IDs (i.e. the 'fam' column)): ",
      paste0(head(gcae_input_data$fam_table$fam), collapse = ", "), " \n"
    )
  }

}
