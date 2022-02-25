#' Create setting 1 for GCAE
#'
#' * Date: 2022-01-17
#' * Goal: do the simplest useful simulation possible
#' * Hypothesis: on the dimensionality reduction plots,
#'   there will be three points.
#'   With 'points' I really mean points, i.e. not clusters,
#'   as there are exactly 3 genotypes
#' * n = 1000
#'
#' Genotype|Phenotype|Allele frequency|Population|Superpopulation
#' --------|---------|----------------|----------|---------------
#' AA      |0        |25%             |A         |Americas
#' AC      |50       |50%             |B         |Americas
#' CC      |100      |25%             |C         |Central/South Asia
#'
#' @param base_input_filename base filename of the files to be created
#' @param n_individuals number of individuals
#' @param n_traits the number of quantitative traits
#' @param n_snps_per_trait the number of SNPs that determine a trait
#' @return a `gcae_input_filenames`, as can be checked by
#' \link{check_gcae_input_filenames}
#' @examples
#' if (plinkr::is_plink_installed()) {
#'   # Create the files
#'   gcae_input_filenames <- create_gcae_input_files_1()
#'
#'   # Clean up
#'   file.remove(as.character(unlist(gcae_input_filenames)))
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
create_gcae_input_files_1 <- function(
  base_input_filename = "setting_1",
  n_individuals = 1000,
  n_traits = 1,
  n_snps_per_trait = 1,
  plink_options = plinkr::create_plink_options()
) {
  set.seed(1)
  traits <- rep(
    list(
      plinkr::create_additive_trait(
        mafs = 0.499999,
        base_phenotype_value = pi,
        phenotype_increase = pi,
        n_snps = n_snps_per_trait
      )
    ),
    n_traits
  )
  assoc_qt_data <- plinkr::create_demo_assoc_qt_data(
    n_individuals = n_individuals,
    traits = traits
  )
  # All on chromosome 1
  assoc_qt_data$data$map_table$CHR <- 1
  sum_phenotypes <- rowSums(
    assoc_qt_data$phenotype_data$phe_table[, c(-1, -2)]
  )
  # Set populations
  is_a <- order(sum_phenotypes) < n_individuals / 3
  is_b <- order(sum_phenotypes) > 2 * n_individuals / 3
  is_c <- !is_a & !is_b
  testthat::expect_equal(sum(is_a) + sum(is_b) + sum(is_c), n_individuals)
  assoc_qt_data$phenotype_data$phe_table$FID[is_a] <- "A"
  assoc_qt_data$phenotype_data$phe_table$FID[is_b] <- "B"
  assoc_qt_data$phenotype_data$phe_table$FID[is_c] <- "C"
  assoc_qt_data$phenotype_data$phe_table$IID <- seq(1, n_individuals) # nolint follow PLINK convention to use upppercase

  assoc_qt_data$data$ped_table$FID <- assoc_qt_data$phenotype_data$phe_table$FID # nolint follow PLINK convention to use upppercase
  assoc_qt_data$data$ped_table$IID <- assoc_qt_data$phenotype_data$phe_table$IID # nolint follow PLINK convention to use upppercase


  assoc_qt_data$data <- plinkr::convert_plink_text_data_to_plink_bin_data(
    plink_text_data = assoc_qt_data$data,
    plink_options = plink_options
  )
  filenames <- plinkr::save_plink_bin_data(
    plink_bin_data = assoc_qt_data$data,
    base_input_filename = base_input_filename
  )
  phe_filename <- paste0(base_input_filename, ".phe")
  labels_filename <- paste0(base_input_filename, "_labels.csv")
  plinkr::save_phe_table(
    phe_table = assoc_qt_data$phenotype_data$phe_table,
    phe_filename = phe_filename
  )
  filenames$phe_filename <- phe_filename

  labels <- tibble::tibble(
    population = assoc_qt_data$phenotype_data$phe_table$IID,
    super_population = assoc_qt_data$phenotype_data$phe_table$FID
  )
  save_labels_file(
    labels_table = labels,
    labels_filename = labels_filename
  )
  filenames$labels_filename <- labels_filename
  filenames
}
