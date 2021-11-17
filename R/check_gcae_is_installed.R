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
  ormr_folder_name <- gcae_options$gcae_folder
  if (
    !ormr::is_python_package_installed(
      ormr_folder_name = ormr_folder_name,
      package_name = "tensorflow"
    )
  ) {
    stop(
      "Tensorflow not installed \n",
      "Tip: run 'gcaer::install_gcae_requirements()'"
    )
  }
}
