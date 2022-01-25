#' Get the full path to `run_gcae.py`
#'
#' Get the full path to `run_gcae.py`
#' @inheritParams default_params_doc
#' @return the full path to `run_gcae.py`
#' @author Richèl J.C. Bilderbeek
#' @export
get_run_gcae_py_path <- function(gcae_options) {
  run_gcae_py_path <- file.path(gcae_options$gcae_folder, "run_gcae.py")
  run_gcae_py_path
}
