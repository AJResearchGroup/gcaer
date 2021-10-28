#' Install the GCAE requirements
#' @inheritParams default_params_doc
#' @return nothing
#' @examples
#' install_python_packages()
#' @author Richèl J.C. Bilderbeek
#' @export
install_python_packages <- function(
  gcae_options
) {
  gcaer::check_gcae_options(gcae_options)

  # Get the Python packages' names from the GCAE repo
  gcae_subfolder <- gcaer::get_gcae_subfolder(gcae_options = gcae_options)
  gcae_requirements_txt_path <- file.path(gcae_subfolder, "requirements.txt")
  testthat::expect_true(file.exists(gcae_requirements_txt_path))
  package_names <- readr::read_lines(gcae_requirements_txt_path)

  # Check if packages can be installed
  testthat::expect_true(
    is_miniconda_installed(
      miniconda_path = gcaer::get_miniconda_path(gcae_options = gcae_options)
    )
  )

  # Install packages
  conda_binary_path <- gcaer::get_conda_binary_path(gcae_options = gcae_options)
  testthat::expect_true(file.exists(conda_binary_path))
  reticulate::py_install(packages = package_names, conda = conda_binary_path)

  # Nope, use py_install
  if (1 == 2) {
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
      text <- system2(
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
    text
  }
  invisible(gcae_options)
}
