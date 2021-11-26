#' Check if all the GCAE Python packages are installed.
#'
#' Check if all the GCAE Python packages are installed.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
check_gcae_python_packages_are_installed <- function( # nolint indeed a long function name
  gcae_options = create_gcae_options()
) {
  packages <- gcaer::get_gcae_required_python_packages(
    gcae_options = gcae_options
  )

  for (row_index in seq_len(nrow(packages))) {
    package_name <- packages$package[row_index]
    if (
      !ormr::is_python_package_installed(
        ormr_folder_name = gcae_options$gcae_folder,
        package_name = package_name
      )
    ) {
      stop(
        "Python package '", package_name, "' not installed \n",
        "Tip: run 'gcaer::install_gcae_requirements()'"
      )
    }
    package_version <- packages$version[row_index]
    if (package_version == "") next
    if (
      !ormr::is_python_package_with_version_installed(
        ormr_folder_name = gcae_options$gcae_folder,
        package_name = package_name,
        package_version = package_version
      )
    ) {
      stop(
        "Python package '", package_name,
          "' not installed with the right version. \n",
        "Tip: run 'gcaer::install_gcae_requirements()'"
      )
    }
  }
}
