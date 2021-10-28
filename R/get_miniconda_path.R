#' Get the path where Miniconda and all Pyton packages will be installed
#' @inheritParams default_params_doc
#' @return the `miniconda_path`, as used by \link[reticulate]{reticulate}
#' @examples
#' get_miniconda_path()
#' @author Richèl J.C. Bilderbeek
#' @export
get_miniconda_path <- function(
  gcae_options = create_gcae_options()
) {
  gcaer::check_gcae_options(gcae_options)
  file.path(
    gcae_options$gcae_folder,
    basename(reticulate::miniconda_path())
  )
}
