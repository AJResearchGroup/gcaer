#' Run GCAE from arguments
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
  gcaer::check_gcae_is_installed(gcae_options)

  gcae_subfolder <- file.path(
    gcae_options$gcae_folder, "gcae_v",
    stringr::str_replace_all(gcae_options$gcae_version, "\\.", "_")
  )
  gcae_run_gcae_py_path <- file.path(gcae_subfolder, "run_gcae.py")
  testthat::expect_true(file.exists(gcae_run_gcae_py_path))

  all_args <- c("python3", gcae_run_gcae_py_path, args)
  if (verbose) {
    message(
      "Running: '", gcae_run_gcae_py_path, " ",
        paste(all_args, collapse = " "), "'. \n",
      "Tip: you should be able to copy paste this :-)"
    )
  }

  suppressWarnings(
    text <- system2(
      command = all_args[1],
      args = all_args[-1],
      stdout = TRUE,
      stderr = TRUE
    )
  )
  text
}
