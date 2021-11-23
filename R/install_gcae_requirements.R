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
  t_required <- gcaer::get_gcae_required_python_packages(
    gcae_options = gcae_options
  )

  ormr_folder_name <- gcae_options$gcae_folder
  if (!ormr::does_conda_env_exists(ormr_folder_name = gcae_options$gcae_folder)) {
    ormr::create_conda_env(ormr_folder_name = gcae_options$gcae_folder)
  }
  ormr::check_conda_env_exists(ormr_folder_name = gcae_options$gcae_folder)

  for (i in seq_len(nrow(t_required))) {
    package_name <- t_required$package[i]
    if (verbose) message(i, "/", nrow(t_required), ": ", package_name)
    package_version <- t_required$version[i]
    if (package_version == "") {
      if (
        !ormr::is_python_package_installed(
          ormr_folder_name = ormr_folder_name,
          package_name = package_name
        )
      ) {
        ormr::install_python_package(
          ormr_folder_name = ormr_folder_name,
          package_name = package_name
        )
      }
      testthat::expect_true(
        ormr::is_python_package_installed(
          ormr_folder_name = ormr_folder_name,
          package_name = package_name
        )
      )
    } else {
      if (
        !ormr::is_python_package_with_version_installed(
          ormr_folder_name = ormr_folder_name,
          package_name = package_name,
          package_version = package_version
        )
      ) {
        ormr::install_python_package_with_version(
          ormr_folder_name = ormr_folder_name,
          package_name = package_name,
          package_version = package_version
        )
      }
      testthat::expect_true(
        ormr::is_python_package_with_version_installed(
          ormr_folder_name = ormr_folder_name,
          package_name = package_name,
          package_version = package_version
        )
      )
    }
  }
}
