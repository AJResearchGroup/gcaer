#' Create a `gcae_input_filenames` to be used in testing
#'
#' Create a `gcae_input_filenames` to be used in testing,
#' as can be checked by \link{check_gcae_input_filenames}
#' @inheritParams default_params_doc
#' @return a `gcae_input_filenames`,
#' as can be checked by \link{check_gcae_input_filenames}
#' @seealso use \link{get_gcae_input_filenames} to obtain
#' the `gcae_input_filenames` from a `gcae_setup`
#' (see \link{check_gcae_setup})
#' and `gcae_options`
#' (see \link{check_gcae_options})
#' @examples
#' create_test_gcae_input_filenames()
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_gcae_input_filenames <- function(# nolint indeed a long function name
  bed_filename = get_gcaer_filename("gcae_input_files_1.bed"),
  bim_filename = get_gcaer_filename("gcae_input_files_1.bim"),
  fam_filename = get_gcaer_filename("gcae_input_files_1.fam"),
  phe_filename = get_gcaer_filename("gcae_input_files_1.phe"),
  labels_filename = get_gcaer_filename("gcae_input_files_1_labels.csv")
) {
  gcaer::create_gcae_input_filenames(
    bed_filename = bed_filename,
    bim_filename = bim_filename,
    fam_filename = fam_filename,
    phe_filename = phe_filename,
    labels_filename = labels_filename
  )
}
