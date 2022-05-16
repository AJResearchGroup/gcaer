#' Save a `gcae_input_data`
#' @inheritParams default_params_doc
#' @return the `gcae_input_data` invisibly
#' @author Richèl J.C. Bilderbeek
#' @export
save_gcae_input_data <- function(
  gcae_input_data,
  gcae_input_filenames
) {
  gcaer::check_gcae_input_data_data_type(gcae_input_data)
  gcaer::check_gcae_input_filenames(gcae_input_filenames)

  plinkr::save_bed_table(
    bed_table = gcae_input_data$bed_table,
    bed_filename = gcae_input_filenames$bed_filename
  )
  plinkr::save_bim_table(
    bim_table = gcae_input_data$bim_table,
    bim_filename = gcae_input_filenames$bim_filename
  )
  plinkr::save_fam_table(
    fam_table = gcae_input_data$fam_table,
    fam_filename = gcae_input_filenames$fam_filename
  )
  plinkr::save_phe_table(
    phe_table = gcae_input_data$phe_table,
    phe_filename = gcae_input_filenames$phe_filename
  )
  if ("labels_table" %in% names(gcae_input_data)
  ) {
    gcaer::save_labels_table(
      labels_table = gcae_input_data$labels_table,
      labels_filename = gcae_input_filenames$labels_filename
    )
  }
  invisible(gcae_input_data)
}
