#' Create a \link{gcaer} report, to be used when reporting bugs
#' @inheritParams default_params_doc
#' @examples
#' gcaer_report()
#' @author Richèl J.C. Bilderbeek
#' @export
gcaer_report <- function(
  gcae_options = gcaer::create_gcae_options()
) {
  message("OS: ", rappdirs::app_dir()$os)
  message("GCAE folder (from 'gcae_options'): ", gcae_options$gcae_folder)
  message("GCAE version (from 'gcae_options'): ", gcae_options$gcae_version)
  if (gcaer::is_gcae_installed(gcae_options)) {
    message("GCAE is installed: yes")
  } else {
    message("GCAE is installed: no")
  }
  message(paste0(devtools::session_info(), collapse = "\n"))
}
