#' Determine if `GCAE` is installed
#' @inheritParams default_params_doc
#' @return `TRUE` if `GCAE` is installed
#' @examples
#' is_gcae_installed()
#' @author Richèl J.C. Bilderbeek
#' @export
is_gcae_installed <- function(
  gcae_options = create_gcae_options(),
  verbose = FALSE
) {
  gcaer::check_gcae_options(gcae_options = gcae_options)

  result <- FALSE
  tryCatch({
    gcaer::check_gcae_is_installed(gcae_options = gcae_options)
    result <- TRUE
  },
  error = function(e) {
    if (verbose) {
      message(e$message)
    }
  }
  )
  testthat::expect_equal(length(result), 1)

  # Check if all packages are in

  package_names <- gcaer::get_gcae_required_python_packages(
    gcae_options = gcae_options
  )
  for (package_name in package_names) {
    if (!ormr::is_python_package_installed(
      ormr_folder_name = gcae_options$gcae_folder,
      package_name = package_name
    )) {
      stop("Python package '", package_name, "' not installed")
    }
  }

  result
}
