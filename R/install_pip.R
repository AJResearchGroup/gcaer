#' Install `pip`
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' is_pip_installed()
#' @author Richèl J.C. Bilderbeek
#' @export
install_pip <- function(
  gcae_options = create_gcae_options()
) {
  if (gcaer::is_pip_installed(gcae_options = gcae_options)) {
    stop(
      "Cannot install 'pip', as it is already installed \n",
      "'gcae_options$gcae_folder': ", gcae_options$gcae_folder, " \n",
      "'gcae_options$gcae_version': ", gcae_options$gcae_version, " \n",
      " \n",
      "Tip: run 'gcaer::install_pip()'"
    )
  }
  conda_binary_path <- gcaer::get_conda_binary_path(gcae_options = gcae_options)
  if (!file.exists(conda_binary_path)) {
    stop(
      "'conda_binary_path' not found at ", conda_binary_path, " \n",
      "Tip: use 'install_miniconda'"
    )

  }
  conda_binary_path <- gcaer::get_conda_binary_path(gcae_options = gcae_options)
  testthat::expect_true(file.exists(conda_binary_path))
  reticulate::py_install(packages = "pip", conda = conda_binary_path)
  gcaer::check_pip_is_installed(gcae_options = gcae_options)
  invisible(gcae_options)
}
