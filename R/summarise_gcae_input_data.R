#' Summarise the `gcae_input_data`
#'
#' Summarise the `gcae_input_data`
#' @inheritParams default_params_doc
#' @return This function will show the summary using \link{message}.
#' A \link{list} with all the elements shown is returned as well
#' @note this function is named after the base R \link{summarise} function
#' @examples
#' gcae_input_data <- create_test_gcae_input_data()
#' summarise_gcae_input_data(gcae_input_data)
#' @author Richèl J.C. Bilderbeek
#' @export
summarise_gcae_input_data <- function(
  gcae_input_data,
  verbose = FALSE
) {
  summary <- list(
    n_individuals_in_bed_table = ncol(gcae_input_data$bed_table),
    n_snps_in_bed_table = nrow(gcae_input_data$bed_table),
    n_snps_in_bim_table = nrow(gcae_input_data$bim_table),
    n_individuals_in_fam_table = nrow(gcae_input_data$fam_table),
    n_individuals_in_labels_table = nrow(gcae_input_data$labels_table),
    n_groups_in_labels_table = length(
      unique(gcae_input_data$labels_table$super_population)
    ),
    n_individuals_in_phe_table = nrow(gcae_input_data$phe_table)
  )
  if (verbose) {
    for (i in seq_along(summary)) {
      message(names(summary)[i], ": ", summary[[i]])
    }
  }
  summary
}
