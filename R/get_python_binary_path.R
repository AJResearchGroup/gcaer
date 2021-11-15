#' Get the path to the `python` binary
#' @inheritParams default_params_doc
#' @return the path to the `python` binary
#' @author Richèl J.C. Bilderbeek
#' @export
get_python_binary_path <- function(
  gcae_options = create_gcae_options()
) {
  miniconda_path <- get_miniconda_path(gcae_options = gcae_options)
  python_binary_path <- file.path(
    miniconda_path,
    "envs/r-reticulate/bin/python"
  )
  if (1 == 2) {
    python_binary_path <- reticulate:::python_binary_path(
      dir = miniconda_path
    )
  }
  python_binary_path
}
