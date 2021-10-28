#' Determine if Miniconda is installed
#' @inheritParams default_params_doc
#' @return TRUE if Miniconda is installed
#' @examples
#' is_miniconda_installed()
#' @author Richèl J.C. Bilderbeek
#' @export
is_miniconda_installed <- function(
  miniconda_path = get_miniconda_path(create_gcae_options())
  ) {
  # These are the same tests as in reticulate::install_miniconda.
  # These functions, however, are not exported.
  # As reticulate currently has 400 open
  # Issues (see https://github.com/rstudio/reticulate/issues),
  # I will not add an Issue to request to export those functions
  normalized_path <- normalizePath(miniconda_path, mustWork = FALSE)
  reticulate:::miniconda_exists(path = normalized_path) &&
    reticulate:::miniconda_test(path = normalized_path)
}
