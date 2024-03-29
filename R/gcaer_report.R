#' Create a \link{gcaer} report, to be used when reporting bugs
#' @inheritParams default_params_doc
#' @examples
#' if (plinkr::is_on_ci()) {
#'   gcaer_report()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
gcaer_report <- function(
  gcae_options = gcaer::create_gcae_options(),
  verbose = FALSE
) {
  message("OS: ", rappdirs::app_dir()$os)
  message("GCAE folder (from 'gcae_options'): ", gcae_options$gcae_folder)
  message("GCAE folder (from 'gcae_options'): ", gcae_options$gcae_folder)
  message("GCAE version (from 'gcae_options'): ", gcae_options$gcae_version)
  if (gcaer::is_gcae_installed(gcae_options)) {
    message("GCAE is installed: yes")
  } else {
    message("GCAE is installed: no")
  }
  message("**********************************")
  message("* Report from the 'ormr' package *")
  message("**********************************")
  ormr_folder_name <- gcae_options$ormr_folder_name
  python_version <- gcae_options$python_version
  ormr::ormr_report(
    ormr_folder_name = ormr_folder_name,
    python_version = python_version,
    verbose = verbose
  )

  message("******************")
  message("* R session info *")
  message("******************")
  message(paste0(devtools::session_info(), collapse = "\n"))
}
