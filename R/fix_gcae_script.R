#' Fix the GCAE script
#'
#' Fix the GCAE script.
#'
#' Since `https://github.com/cnettel/GenoCAE/commit/`
#' `ed5c21c493b50e6da159b4ed4a70a454824f883f` the gcaer build broke,
#' due to the addition of:
#'
#' \code{
#'   tf.config.experimental.enable_tensor_float_32_execution(
#'     False
#'   )
#' }
#'
#' This function comments out that line.
#' @inheritParams default_params_doc
#' @return nothing. The script file modified
#' @author Richèl J.C. Bilderbeek
#' @export
fix_gcae_script <- function(
  gcae_options = create_gcae_options()
) {
  gcaer::check_gcae_options(gcae_options = gcae_options)
  gcaer::check_gcae_repo_is_cloned(gcae_options = gcae_options)
  run_gcae_py_path <- gcaer::get_run_gcae_py_path(gcae_options)
  testthat::expect_true(file.exists(run_gcae_py_path))

  script_text <- readr::read_lines(run_gcae_py_path)
  first_line_regex <- "^tf.config.experimental.enable_tensor_float_32_execution"
  index <- stringr::str_which(
    string = script_text,
    pattern = first_line_regex
  )
  if (length(index) != 0) {
    # Add comments
    script_text[index:(index + 2)] <- stringr::str_replace(
      string = script_text[index:(index + 2)],
      pattern = "(.*)",
      replacement = "#\\1"
    )
    readr::write_lines(
      x = script_text,
      file = run_gcae_py_path
    )
  } else {
    stop("GCAE script is already fixed.")
  }
}
