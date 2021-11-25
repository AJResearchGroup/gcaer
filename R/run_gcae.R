#' Run GCAE from arguments
#'
#' Run GCAE from arguments.
#' In some contexts, e.g. \link{gcae_train},
#' the working directory must be the same as the folder the
#' `run_gcae.py` scipt is in (see
#' \url{https://github.com/kausmees/GenoCAE/issues/10})
#' @inheritParams default_params_doc
#' @param args arguments for the GCAE executable
#' @return the text that GCAE returns
#' @examples
#' if (is_gcae_installed()) {
#'   run_gcae("--help")
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
run_gcae <- function(
  args,
  gcae_options = create_gcae_options(),
  verbose = FALSE
) {
  gcaer::check_gcae_options(gcae_options)
  # gcaer::check_gcae_is_installed(gcae_options)

  run_gcae_py_path <- gcaer::get_run_gcae_py_path(gcae_options = gcae_options)
  testthat::expect_true(file.exists(run_gcae_py_path))

  output <- ormr::run_python_script_with_args(
    ormr_folder_name = gcae_options$gcae_folder,
    python_script_path = run_gcae_py_path,
    args = args,
    verbose = verbose
  )
  output
}
