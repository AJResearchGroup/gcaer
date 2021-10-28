#' Install the GCAE requirements
#' @inheritParams default_params_doc
#' @return the text produced at installation
#' @examples
#' gcaer_report()
#' @author Richèl J.C. Bilderbeek
#' @export
install_gcae_requirements <- function(
  gcae_options = create_gcae_options(),
  verbose = FALSE
) {
  # Install Miniconda
  miniconda_path <- gcaer::get_miniconda_path(gcae_options = gcae_options)
  if (!gcaer::is_miniconda_installed(miniconda_path = miniconda_path)) {
    gcaer::install_miniconda(miniconda_path = miniconda_path)
  } else if (verbose) {
    message("Miniconda already installed at ", miniconda_path)
  }
  testthat::expect_true(gcaer::is_miniconda_installed(miniconda_path))
  # Install pip
  if (verbose) {
    message("Install pip")
  }
  # 'reticulate::py_install' will always produce output
  conda_binary_path <- gcaer::get_conda_binary_path(gcae_options = gcae_options)
  testthat::expect_true(file.exists(conda_binary_path))
  reticulate::py_install("pip", conda = conda_binary_path)
  # Upgrade pip
  if (1 == 2) {
    if (verbose) {
      message("Upgrade pip ")
    }
    python_bin_path <- file.path(miniconda_path, "bin", "python")
    testthat::expect_true(file.exists(python_bin_path))
    text_upgrade_pip <- gcaer::upgrade_pip(
      python_bin_path = python_bin_path,
      verbose = verbose
    )
    if (verbose) {
      message("text_upgrade_pip: ", paste0(text_upgrade_pip, collapse = " "))
    }
  }
  # Installing requirements
  text_install_requirements <- gcaer::install_python_packages(
    gcae_options = gcae_options
  )

  text <- c(
    text_upgrade_pip,
    text_install_requirements
  )
  text
}
