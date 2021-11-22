#' Install the GCAE requirements
#' @inheritParams default_params_doc
#' @return the text produced at installation
#' @examples
#' # install_gcae_requirements() # Takes 30 mins
#' @author Richèl J.C. Bilderbeek
#' @export
install_gcae_requirements <- function(
  gcae_options = create_gcae_options(),
  verbose = FALSE
) {
  package_names <- gcaer::get_gcae_required_python_packages(
    gcae_options = gcae_options
  )

  ormr_folder_name <- gcae_options$gcae_folder
  if (!ormr::does_conda_env_exists(ormr_folder_name = gcae_options$gcae_folder)) {
    ormr::create_conda_env(ormr_folder_name = gcae_options$gcae_folder)
  }
  ormr::check_conda_env_exists(ormr_folder_name = gcae_options$gcae_folder)
  ormr::install_python_packages(
    ormr_folder_name = ormr_folder_name,
    package_names = package_names
  )
}
