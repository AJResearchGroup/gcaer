#' Resize the `gcae_input_data` to only contain the shared individuals.
#'
#' Resize the `gcae_input_data` to only contain the shared individuals.
#' @inheritParams default_params_doc
#' @return the `gcae_input_data` with only shared individuals
#' @seealso
#' Related resize functions:
#'
#'  * Use \link{resize_to_shared_individuals_from_data}
#'    to resize the data in in-memory data
#'  * Use \link{resize_to_shared_individuals_from_files}
#'    to resize the data in files
#'
#' @examples
#' gcae_input_data <- create_test_gcae_input_data()
#'
#' # Show before
#' summarise_gcae_input_data(gcae_input_data)
#'
#' gcae_input_data <- resize_to_shared_individuals_from_data(gcae_input_data)
#'
#' # Show after
#' summarise_gcae_input_data(gcae_input_data)
#' @author Richèl J.C. Bilderbeek
#' @export
resize_to_shared_individuals_from_data <- function( # nolint indeed a long function name
  gcae_input_data,
  verbose = FALSE
) {
  # gcae_input_data can be invalid, which is _why_ we resize
  gcaer::check_gcae_input_data_data_type(gcae_input_data)

  # The data must at least be PLINK binary date, i.e.
  # the .bed, .bim and .fam tables must match sizes
  plink_bin_data <- plinkr::create_plink_bin_data(
    bim_table = gcae_input_data$bim_table,
    fam_table = gcae_input_data$fam_table,
    bed_table = gcae_input_data$bed_table
  )
  plinkr::check_plink_bin_data(plink_bin_data = plink_bin_data)

  # Get the sample IDs (FID and IID) from
  #  * ~~bed~~: nope, labels are from .fam and .bim file
  #  * ~~bim~~: nope, holds SNPs, not individuals
  #  * fam
  #  * labels
  #  * phe

  # These labels are added from the .fam table, so
  # the .bed table can be ignored
  # bed_table_individuals <- colnames(gcae_input_data$bed_table)                # nolint indeed, do not use this code :-)

  fam_table_individuals <- plinkr::get_sample_ids_from_fam_table(
    fam_table = gcae_input_data$fam_table
  )
  phe_table_individuals <- plinkr::get_sample_ids_from_phe_table(
    phe_table = gcae_input_data$phe_table
  )
  # We don't need it, but we keep it here for symmetry
  # labels_table_individuals <- gcae_input_data$labels_table$population         # nolint indeed, do not use this code

  iids_from_fam_table <- gcae_input_data$fam_table$id
  iids_from_labels <- gcae_input_data$labels_table$population
  iids_from_phe_table <- gcae_input_data$phe_table$IID
  # The readable way from https://stackoverflow.com/a/3695700,
  # thanks https://stackoverflow.com/users/233293/bnaul
  common_iids <- intersect(
    intersect(iids_from_fam_table, iids_from_labels),
    iids_from_phe_table
  )
  if (length(common_iids) == 0) {
    stop(
      "Empty common IDs set. \n",
      "head(iids_from_fam_table): ",
        paste0(utils::head(iids_from_fam_table), collapse = ","), " \n",
      "head(iids_from_labels): ",
        paste0(utils::head(iids_from_labels), collapse = ","), " \n",
      "head(iids_from_phe_table): ",
        paste0(utils::head(iids_from_phe_table), collapse = ","), " \n"
    )
  }
  sample_ids <- plinkr::get_sample_ids_from_fam_table(
    fam_table = gcae_input_data$fam_table
  )
  keep_ids <- sample_ids$id %in% common_iids
  common_sample_ids <- sample_ids[keep_ids, ]
  plinkr::check_sample_ids(common_sample_ids)

  #
  # Resize to the new size
  #
  new_bed_table <- matrix(
    data = gcae_input_data$bed_table[, keep_ids],
    nrow = nrow(gcae_input_data$bed_table),
    ncol = sum(keep_ids),
    dimnames = list(
      rownames(gcae_input_data$bed_table),
      colnames(gcae_input_data$bed_table)[keep_ids]
    )
  )
  plinkr::check_bed_table(new_bed_table)

  new_fam_table <- tibble::as_tibble(
    merge(gcae_input_data$fam_table, common_sample_ids)
  )
  if (verbose) {
    message("head(new_fam_table):")
    message(paste0(knitr::kable(utils::head(new_fam_table)), collapse = "\n"))
  }
  plinkr::check_fam_table(new_fam_table)

  new_labels_table <- gcae_input_data$labels_table[
    gcae_input_data$labels_table$population %in% common_iids,
  ]
  if (verbose) {
    message("head(new_labels_table):")
    message(
      paste0(knitr::kable(utils::head(new_labels_table)), collapse = "\n")
    )
  }
  gcaer::check_labels_table(new_labels_table)

  new_phe_table <- tibble::as_tibble(
    merge(gcae_input_data$phe_table,
    common_sample_ids,
    by.x = c("FID", "IID"),
    by.y = c("fam", "id"))
  )
  if (verbose) {
    message("head(new_phe_table):")
    message(paste0(knitr::kable(utils::head(new_phe_table)), collapse = "\n"))
  }
  plinkr::check_phe_table(new_phe_table)

  new_gcae_input_data <- list(
    bed_table = new_bed_table,
    bim_table = gcae_input_data$bim_table,
    fam_table = new_fam_table,
    labels_table = new_labels_table,
    phe_table = new_phe_table
  )
  new_gcae_input_data
}
