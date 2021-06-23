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
  gcae_exe_path <- gcae_options$gcae_exe_path
  if (!file.exists(gcae_exe_path)) {
    stop(
      "GCAE is not installed. \n",
      "Executable is not found \n",
      "GCAE folder: ", gcae_options$gcae_folder, " \n",
      "GCAE executable: ", gcae_exe_path, " \n",
      "Tip: run 'gcaer::install_gcae()'"
    )
  }
}
