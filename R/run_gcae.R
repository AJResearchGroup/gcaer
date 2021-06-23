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

  # Will freeze otherwise
  if (gcae_options$gcae_version == "1.7" && sum(args == "--noweb") == 0) {
    args <- c(args, "--noweb")
  }
  gcae_exe_path <- gcae_options$gcae_exe_path
  if (verbose) {
    message(
      "Running: '", gcae_exe_path, " ", paste(args, collapse = " "), "'. \n",
      "Tip: you should be able to copy paste this :-)"
    )
  }
  suppressWarnings(
    text <- system2(
      command = normalizePath(gcae_exe_path),
      args = args,
      stdout = TRUE,
      stderr = TRUE
    )
  )
  error_line_index <- stringr::str_which(text, "Error:")
  if (length(error_line_index) != 0) {
    error_text <- text[seq(from = error_line_index, to = length(text))]
    stop(
      paste0(error_text, collapse = " \n"),
      " \n",
      "Called GCAE with commands: \n",
      normalizePath(gcae_exe_path), " ", paste0(args, collapse = " "), "\n",
      "Tip: you should be able to copy-paste this"
    )
  }
  warnings <- stringr::str_subset(text, "Warning")
  if (length(warnings) != 0) warning(warnings)
  text
}
