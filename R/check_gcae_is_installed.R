#' Check if GCAE is installed
#'
#' Check if GCAE is installed. Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if GCAE is not installed.
#' @author Richèl J.C. Bilderbeek
#' @export
check_gcae_is_installed <- function(
  gcae_options = create_gcae_options()
) {
  gcaer::check_gcae_options(gcae_options)

  gcae_subfolder <- file.path(
    gcae_options$gcae_folder, "gcae_v",
    stringr::str_replace_all(gcae_options$gcae_version, "\\.", "_")
  )
  if (!dir.exists(gcae_subfolder)) {
    stop(
      "GCAE is not installed. \n",
      "GCAE subfolder is not found \n",
      "GCAE folder: ", gcae_options$gcae_folder, " \n",
      "GCAE subfolder: ", gcae_subfolder, " \n",
      "Tip: run 'gcaer::install_gcae()'"
    )
  }

}
