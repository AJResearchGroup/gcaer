#' Create the options to run GCAE
#'
#' Create the options to run GCAE.
#' @inheritParams default_params_doc
#' @return the GCAE options,
#' as can be checked by \link{check_gcae_options}
#' @examples
#' # Use the default GCAE version
#' create_gcae_options()
#' @author Richèl J.C. Bilderbeek
#' @export
create_gcae_options <- function(
  gcae_folder = gcaer::get_gcae_folder(),
  ormr_folder_name = gcaer::get_default_ormr_folder_name(),
  gcae_version = "1.0",
  python_version = "3.6"
) {
  gcaer::check_gcae_folder(gcae_folder)
  gcaer::check_ormr_folder_name(ormr_folder_name) # Move to ormr
  gcaer::check_gcae_version(gcae_version)
  gcaer::check_python_version(python_version)
  list(
    gcae_folder = gcae_folder,
    gcae_version = gcae_version,
    python_version = python_version
  )
}
