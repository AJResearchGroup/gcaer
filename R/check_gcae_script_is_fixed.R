#' Check if the GCAE script is fixed
#'
#' Check if the GCAE script is fixed
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
check_gcae_script_is_fixed <- function(
  gcae_options = create_gcae_options()
) {
  gcaer::check_gcae_options(gcae_options)
  gcaer::check_gcae_repo_is_cloned(gcae_options = gcae_options)
  run_gcae_py_path <- gcaer::get_run_gcae_py_path(gcae_options)
  testthat::expect_true(file.exists(run_gcae_py_path))

  script_text <- readr::read_lines(run_gcae_py_path)
  first_line_regex <- "^tf.config.experimental.enable_tensor_float_32_execution"
  first_line_index <- stringr::str_which(
    string = script_text,
    pattern = first_line_regex
  )
  if (length(first_line_index) != 0) {
    stop(
      "GCAE script is not fixed."
    )
  }
  invisible(gcae_options)
}
