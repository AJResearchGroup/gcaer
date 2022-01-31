#' Create a `gcae_input_filenames`
#'
#' Create a `gcae_input_filenames`,
#' as can be checked by \link{check_gcae_input_filenames},
#' from a `gcae_setup` (see \link{check_gcae_setup})
#' and a `gcae_options` (see \link{check_gcae_options})
#' using default naming
#' @inheritParams default_params_doc
#' @return a `gcae_input_filenames`,
#' as can be checked by \link{check_gcae_input_filenames}
#' @seealso use \link{create_gcae_input_filenames} to
#' create the filesnames yourself
#' @examples
#' gcae_setup <- create_test_gcae_setup()
#' gcae_input_filenames <- get_gcae_input_filenames(
#'   gcae_setup = gcae_setup
#' )
#' file.exists(gcae_input_filenames$bed_filename)
#' file.exists(gcae_input_filenames$bim_filename)
#' file.exists(gcae_input_filenames$fam_filename)
#' file.exists(gcae_input_filenames$phe_filename)
#' file.exists(gcae_input_filenames$labels_filename)
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcae_input_filenames <- function(
  gcae_setup
) {
  base_input_filename <- gcaer::clean_file_path(
    file.path(
      gcae_setup$datadir,
      gcae_setup$data
    )
  )
  bed_filename <- paste0(base_input_filename, ".bed")
  bim_filename <- paste0(base_input_filename, ".bim")
  fam_filename <- paste0(base_input_filename, ".fam")
  phe_filename <- paste0(base_input_filename, ".phe")
  labels_filename <- paste0(base_input_filename, "_labels.csv")
  gcaer::create_gcae_input_filenames(
    bed_filename = bed_filename,
    bim_filename = bim_filename,
    fam_filename = fam_filename,
    phe_filename = phe_filename,
    labels_filename = labels_filename
  )
}
