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
  gcae_requirements_filename <- file.path(
    get_gcae_subfolder(), "requirements.txt"
  )
  package_names <- readLines(gcae_requirements_filename)

  ormr_folder_name <- gcae_options$gcae_folder
  ormr::create_conda_env(ormr_folder_name = ormr_folder_name)
  ormr::install_python_packages(
    ormr_folder_name = ormr_folder_name,
    package_names = package_names
  )
}
