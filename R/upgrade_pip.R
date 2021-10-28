#' Upgrade pip
#' @inheritParams default_params_doc
#' @return the text of the installation
#' @export
upgrade_pip <- function(
  python_bin_path = reticulate::py_config()$python,
  verbose = FALSE
) {
  testthat::expect_true(file.exists(python_bin_path))
  args <- c(
    normalizePath(python_bin_path),
    "-m",
    "pip",
    "install", "--upgrade", "pip"
  )
  if (verbose) {
    message("args: ", paste0(args, collapse = " "))
  }
  suppressWarnings(
    text <- system2(
      command = args[1],
      args = args[-1],
      stdout = TRUE,
      stderr = TRUE
    )
  )
  text
}
