#' Check if `pip` is installed
#'
#' Check if `pip` is installed.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' if (is_pip_installed()) {
#'   check_pip_is_installed
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
check_pip_is_installed <- function(
  gcae_options = create_gcae_options()
) {
  conda_binary_path <- gcaer::get_conda_binary_path(gcae_options = gcae_options)
  if (!file.exists(conda_binary_path)) {
    stop(
      "'conda_binary_path' not found at ", conda_binary_path, " \n",
      "Tip: use 'gcaer::install_miniconda()'"
    )

  }
  packages <- character(0)
  tryCatch(
    suppressMessages(
      suppressWarnings(
        packages <- gcaer::list_python_packages(gcae_options = gcae_options)
      )
    ),
    warning = function(e) {
      stop(
        "'gcaer::list_python_packages(gcae_options)' failed with a warning. \n",
        "'gcae_options$gcae_folder': ", gcae_options$gcae_folder, " \n",
        "'gcae_options$gcae_version': ", gcae_options$gcae_version, " \n",
        "Warning ('e$message'): ", e$message, " \n",
        "Warning ('e$warning'): ", e$warning, " \n",
        " \n",
        "Tip: run 'gcaer::install_pip()'"
      )
    },
    error = function(e) {
      stop(
        "'gcaer::list_python_packages(gcae_options)' failed with an error. \n",
        "'gcae_options$gcae_folder': ", gcae_options$gcae_folder, " \n",
        "'gcae_options$gcae_version': ", gcae_options$gcae_version, " \n",
        "Error message: ", e$message, " \n",
        " \n",
        "Tip: run 'gcaer::install_pip()'"
      )
    }
  )
  if (!"pip" %in% packages) {
    stop(
      "Package 'pip' not found in the list ",
      "returned by 'gcaer::list_python_packages(gcae_options)'. \n",
      "'gcae_options$gcae_folder': ", gcae_options$gcae_folder, " \n",
      "'gcae_options$gcae_version': ", gcae_options$gcae_version, " \n",
      " \n",
      "Tip: run 'gcaer::install_pip()'"
    )
  }
}
