#' Get the path to the `conda` binary
#' @inheritParams default_params_doc
#' @return the path to the `conda` binary
#' @examples
#' get_conda_binary_path()
#' @author Richèl J.C. Bilderbeek
#' @export
 get_conda_binary_path <- function(
  gcae_options = create_gcae_options()
) {
  gcaer::check_gcae_options(gcae_options)
  file.path(
    gcaer::get_miniconda_path(gcae_options = gcae_options),
    "bin",
    "conda"
  )
}
