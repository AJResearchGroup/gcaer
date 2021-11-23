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

  if (!gcaer::has_cloned_gcae_repo(gcae_options = gcae_options)) {
    stop(
      "GCAE repository is not cloned. \n",
      "Tip: run 'gcaer::clone_gcae_repo()'"
    )
  }
  # t <- ormr::get_installed_python_packages(ormr_folder_name = gcae_options$gcae_folder)
  packages <- gcaer::get_gcae_required_python_packages(
    gcae_options = gcae_options
  )

  for (row_index in seq_len(nrow(packages))) {
    package_name <- packages$package[row_index]
    package_version <- packages$version[row_index]
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
    if (
      !ormr::is_python_package_with_version_installed(
        ormr_folder_name = gcae_options$gcae_folder,
        package_name = package_name,
        package_version = package_version
      )
    ) {
      stop(
        "Python package '", package_name, "' not installed with the right version\n",
        "Tip: run 'gcaer::install_gcae_requirements()'"
      )
    }
  }
}
