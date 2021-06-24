#' Install the GCAE requirements
#' @export
install_gcae_requirements <- function(
  gcae_options = create_gcae_options()
) {
  gcae_subfolder <- file.path(
    gcae_options$gcae_folder, "gcae_v",
    stringr::str_replace_all(gcae_options$gcae_version, "\\.", "_")
  )
  gcae_requirements_txt_path <- file.path(gcae_subfolder, "requirements.txt")
  testthat::expect_true(file.exists(gcae_requirements_txt_path))

  args <- c(
    reticulate::py_config()$python,
    "-m",
    "pip",
    "install", "-r", gcae_requirements_txt_path
  )
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
