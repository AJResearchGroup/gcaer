#' Install the GCAE requirements
#' @inheritParams default_params_doc
#' @export
install_gcae_requirements <- function(
  gcae_options = create_gcae_options(),
  verbose = FALSE
) {
  # Install miniconda
  if (verbose) {
    message("Install miniconda")
  }

  # Will throw an error if Miniconda is already installed
  try(reticulate::install_miniconda(), silent = TRUE)

  # Install pip
  if (verbose) {
    message("Install pip")
  }
  reticulate::py_install("pip")

  # Upgrade pip
  if (verbose) {
    message("Upgrade pip ")
  }
  text_upgrade_pip <- gcaer::upgrade_pip(
    verbose = verbose
  )
  if (verbose) {
    message("text_upgrade_pip: ", paste0(text_upgrade_pip, collapse = " "))
  }

  # Installing requirements
  gcae_subfolder <- gcaer::get_gcae_subfolder(gcae_options = gcae_options)
  gcae_requirements_txt_path <- file.path(gcae_subfolder, "requirements.txt")
  if (verbose) {
    message("Installing requirements from ", gcae_requirements_txt_path)
  }
  testthat::expect_true(file.exists(gcae_requirements_txt_path))
  args <- c(
    reticulate::py_config()$python,
    "-m",
    "pip",
    "install", "-r", gcae_requirements_txt_path
  )
  if (verbose) {
    message("args: ", paste0(args, collapse = " "))
  }
  suppressWarnings(
    text_install_requirements <- system2(
      command = args[1],
      args = args[-1],
      stdout = TRUE,
      stderr = TRUE
    )
  )
  if (verbose) {
    message(
      "text_install_requirements: ",
      paste0(text_install_requirements, collapse = " ")
    )
  }

  text <- c(
    text_upgrade_pip,
    text_install_requirements
  )
  text
}
