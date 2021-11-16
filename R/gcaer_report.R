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
  miniconda_path <- gcaer::get_miniconda_path(gcae_options)
  message("Miniconda path: ", miniconda_path)
  if (gcaer::is_miniconda_installed(miniconda_path)) {
    message("Miniconda installed: yes")
  } else {
    message("Miniconda installed: no")
  }
  if (gcaer::is_pip_installed(gcae_options = gcae_options)) {
    message("pip installed: yes")
    message(
      paste0(
        knitr::kable(
          gcaer::list_python_packages(gcae_options = gcae_options)
        ),
        collapse = " \n"
      )
    )
  } else {
    message("pip installed: no")
  }

  message(paste0(devtools::session_info(), collapse = "\n"))
}
