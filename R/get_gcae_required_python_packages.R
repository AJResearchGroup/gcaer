#' Get the names and version fo all the Python packages GCAE needs
#' @inheritParams default_params_doc
#' @return a character vector
#' @export
get_gcae_required_python_packages <- function(
  gcae_options = create_gcae_options()
) {
  if (!gcaer::has_cloned_gcae_repo(gcae_options = gcae_options)) {
    stop(
      "GCAE repo is not cloned. \n",
      "Tip: run 'gcaer::clone_gcae_repo(gcae_options = gcae_options)' \n",
      paste0(gcaer::gcae_options_to_str(gcae_options = gcae_options), collapse = "\n")
    )
  }
  gcae_requirements_filename <- file.path(
    get_gcae_subfolder(gcae_options = gcae_options), "requirements.txt"
  )
  package_names <- readLines(gcae_requirements_filename)

  # Packages that are not in the GCAE requirements.txt, but needed regardless

  # 'utils' is definitely not needed, it is a namespace
  #
  # package_names <- c(package_names, "utils") # nolint don't do this
  #

  # Remove versions
  #package_names[package_names == "setuptools==47.1.1"] <- "setuptools"
  package_names <- stringr::str_replace(
    string = package_names,
    pattern = "(>|=)=.*$",
    replacement = ""
  )

  package_names

}
