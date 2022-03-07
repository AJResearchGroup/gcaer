#' Create setting 2 for GCAE
#'
#' * Date: 2022-03-07
#' * Goal: assess how well GCAE can predict a phenotype, where the genotype
#'   is a simple relationship between the first SNP only and the phenotype
#' * Hypothesis: it does not matter how many noisy SNPs there are,
#'   prediction is always good. Performance decreases with more noise SNPs
#' * n = 1000
#'
#' @inheritParams default_params_doc
#' @param base_input_filename base filename of the files to be created
#' @param n_individuals number of individuals
#' @param n_random_snps the number of SNPs that do nothing
#' @return a `gcae_input_filenames`, as can be checked by
#' \link{check_gcae_input_filenames}
#' @examples
#' if (plinkr::is_plink_installed()) {
#'   # Create the files
#'   gcae_input_filenames <- create_gcae_input_files_2(
#'     base_input_filename = get_gcaer_tempfilename()
#'   )
#'
#'   # Clean up
#'   file.remove(as.character(unlist(gcae_input_filenames)))
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
create_gcae_input_files_2 <- function(
  base_input_filename = "setting_2",
  n_individuals = 1000,
  n_random_snps = 0,
  plink_options = plinkr::create_plink_options()
) {
  set.seed(1)
  traits <- rep(
    list(
      plinkr::create_additive_trait(
        mafs = 0.499999,
        base_phenotype_value = pi,
        phenotype_increase = pi,
        n_snps = 1
      ),
      plinkr::create_random_trait(
        n_snps = n_random_snps,
        mafs = 0.499999
      )
    )
  )
  assoc_qt_data <- plinkr::create_demo_assoc_qt_data(
    n_individuals = n_individuals,
    traits = traits
  )
  # All on chromosome 1
  assoc_qt_data$data$map_table$CHR <- 1 # nolint PLINK variable naming convention
  assoc_qt_data$phenotype_data$phe_table$random <- NULL
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

  continents <- c(
    "Africa",
    "Antarctica",
    "Asia",
    "Australia",
    "Europe",
    "North America",
    "South America"
  )

  populations <- unique(assoc_qt_data$phenotype_data$phe_table$FID)
  labels_table <- tibble::tibble(
    population = populations,
    super_population = sample(
      continents,
      size = length(populations),
      replace = TRUE
    )
  )
  gcaer::check_labels_table(labels_table)
  gcaer::save_labels_table(
    labels_table = labels_table,
    labels_filename = labels_filename
  )
  filenames$labels_filename <- labels_filename
  filenames
}
