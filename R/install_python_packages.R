#' Install the GCAE requirements
#' @inheritParams default_params_doc
#' @return nothing
#' @examples
#' install_python_packages()
#' @author Richèl J.C. Bilderbeek
#' @export
install_python_packages <- function(
  gcae_options,
  package_names,
  verbose = FALSE
) {
  gcaer::check_gcae_options(gcae_options)
  plinkr::check_verbose(verbose)

  # Check if packages can be installed
  testthat::expect_true(
    is_miniconda_installed(
      miniconda_path = gcaer::get_miniconda_path(gcae_options = gcae_options)
    )
  )

  # Install packages
  conda_binary_path <- gcaer::get_conda_binary_path(gcae_options = gcae_options)
  if (verbose) {
    message("conda_binary_path: ", conda_binary_path)
  }
  testthat::expect_true(file.exists(conda_binary_path))
  if (verbose) {
    message("Installing packages: ", paste(package_names, collapse = ", "))
  }
  reticulate::py_install(packages = package_names, conda = conda_binary_path)
  invisible(gcae_options)
}
