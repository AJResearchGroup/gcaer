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

  ormr_folder_name <- gcae_options$ormr_folder_name
  python_version <- gcae_options$python_version
  testthat::expect_equal(python_version, ormr::get_default_python_version())

  for (i in seq_len(nrow(t_required))) {
    package_name <- t_required$package[i]
    if (verbose) message(i, "/", nrow(t_required), ": ", package_name)

    # If Conda is used, this is a clean version, e.g. '1.2.3'
    # If python3 is used, this contains an operator, e.g. '==3.2.1'
    package_version <- t_required$version[i]
    if (ormr_folder_name == "python3") {
      package_version <- stringr::str_sub(string = package_version, start = 3)
    }

    if (package_version == "") {
      if (
        !ormr::is_python_package_installed(
          ormr_folder_name = ormr_folder_name,
          package_name = package_name,
          python_version = python_version,
          verbose = verbose
        )
      ) {
        ormr::install_python_package(
          ormr_folder_name = ormr_folder_name,
          package_name = package_name,
          python_version = python_version,
          verbose = verbose
        )
      }
      testthat::expect_true(
        ormr::is_python_package_installed(
          ormr_folder_name = ormr_folder_name,
          package_name = package_name,
          python_version = python_version,
          verbose = verbose
        )
      )
    } else {
      if (
        !ormr::is_python_package_with_version_installed(
          ormr_folder_name = ormr_folder_name,
          package_name = package_name,
          package_version = package_version,
          python_version = python_version,
          verbose = verbose
        )
      ) {
        ormr::install_python_package_with_version(
          ormr_folder_name = ormr_folder_name,
          package_name = package_name,
          package_version = package_version,
          python_version = python_version,
          verbose = verbose
        )
      }
      testthat::expect_true(
        ormr::is_python_package_with_version_installed(
          ormr_folder_name = ormr_folder_name,
          package_name = package_name,
          package_version = package_version,
          python_version = python_version,
          verbose = verbose
        )
      )
    }
  }
}
