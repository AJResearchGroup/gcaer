#' Upgrade pip
#' @inheritParams default_params_doc
#' @return the text of the installation
#' @export
upgrade_pip <- function(
  verbose = FALSE
) {
  # Upgrade pip
  args <- c(
    reticulate::py_config()$python,
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
