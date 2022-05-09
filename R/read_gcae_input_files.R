#' Read the GenoCAE input filenames
#'
#' @inheritParams default_params_doc
#' @return the GCAE data in the form of a \link{list}
#' with the following elements:
#'   * `bed_table`: a `.bed` table,
#'     as can be checked by \link[plinkr]{check_bed_table}
#'   * `bim_table`: a `.bim` table,
#'     as can be checked by \link[plinkr]{check_bim_table}
#'   * `fam_table`: a `.fam` table,
#'     as can be checked by \link[plinkr]{check_fam_table}
#'   * `phe_table`: a `.phe` table,
#'     as can be checked by \link[plinkr]{check_phe_table}
#'   * `labels_table`: a `.csv` table,
#'     as can be checked by \link{check_labels_table}
#' @examples
#' if (plinkr::is_plink_installed()) {
#'   # Create the files
#'   gcae_input_filenames <- create_gcae_input_files_1(
#'     base_input_filename = get_gcaer_tempfilename()
#'   )
#'
#'   # Read the files
#'   gcae_input_data <- read_gcae_input_files(gcae_input_filenames)
#'
#'   # Summarise the data
#'   summarise_gcae_input_data(gcae_input_data)
#'
#'   # Clean up
#'   file.remove(as.character(unlist(gcae_input_filenames)))
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
read_gcae_input_files <- function(
  gcae_input_filenames,
  verbose = TRUE
) {
  gcaer::check_gcae_input_filenames(gcae_input_filenames)
  for (filename in as.character(unlist(gcae_input_filenames))) {
    if (filename != "" && !file.exists(filename)) {
      stop(
        "'read_gcae_input_files' cannot find file at path '",
        filename, "' \n"
      )
    }
  }

  base_input_filename <- tools::file_path_sans_ext(
    gcae_input_filenames$bed_filename
  )
  if (verbose) {
    message("Reading PLINK binary data, with basename ", base_input_filename)
  }
  gcae_input_data <- plinkr::read_plink_bin_data(
    base_input_filename = base_input_filename
  )
  if ("labels_filename" %in% names(gcae_input_filenames)) {
    if (verbose) {
      message(
        "Reading the labels table, with filename ",
        gcae_input_filenames$labels_filename
      )
    }
    gcae_input_data$labels_table <- gcaer::read_labels_file(
      gcae_input_filenames$labels_filename
    )
  } else {
    if (verbose) {
      message("No labels table to read")
    }
  }
  if (verbose) {
    message(
      "Reading the PLINK phenotype file, with filename ",
      gcae_input_filenames$phe_filename
    )
  }
  gcae_input_data$phe_table <- plinkr::read_plink_phe_file(
    gcae_input_filenames$phe_filename
  )
  gcae_input_data
}
