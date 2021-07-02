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
  gcaer::check_gcae_is_installed(gcae_options)

  gcae_subfolder <- gcaer::get_gcae_subfolder(gcae_options = gcae_options)
  gcae_run_gcae_py_path <- file.path(gcae_subfolder, "run_gcae.py")
  testthat::expect_true(file.exists(gcae_run_gcae_py_path))

  all_args <- c(reticulate::py_config()$python, gcae_run_gcae_py_path, args)
  if (verbose) {
    message(
      "Running: '", paste(all_args, collapse = " "), "'. \n",
      "Tip: you should be able to copy paste this :-)"
    )
  }

  user_work_dir <- getwd()
  setwd(dirname(gcae_run_gcae_py_path))

  suppressWarnings(
    text <- system2(
      command = all_args[1],
      args = all_args[-1],
      stdout = TRUE,
      stderr = TRUE
    )
  )

  setwd(user_work_dir)
  text


  if (any(stringr::str_detect(text, "(Import|ModuleNotFound)Error"))) {
    stop(
      "Running: '", paste(all_args, collapse = " "), "' failed, \n",
      "with message: \n",
      "\n",
      paste(text, collapse = "\n"),
      "\n",
      "\n",
      "Tip 1: run 'gcaer::install_gcae_requirements' \n",
      "Tip 2: you should be able to copy paste this :-)"
    )
  }
  if (any(stringr::str_detect(text, "Error"))) {
    stop(
      "Running: '", paste(all_args, collapse = " "), "' failed, \n",
      "with message: \n",
      "\n",
      paste(text, collapse = "\n"),
      "\n",
      "\n",
      "Tip: you should be able to copy paste this :-)"
    )
  }
  text
}
