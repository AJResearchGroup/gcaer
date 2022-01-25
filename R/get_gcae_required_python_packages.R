#' Get the names and version of all the Python packages GCAE needs
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with columns
#'  * `package`
#'  * `version`
#' @export
get_gcae_required_python_packages <- function( # nolint indeed a long function name
  gcae_options = create_gcae_options()
) {
  if (!gcaer::has_cloned_gcae_repo(gcae_options = gcae_options)) {
    stop(
      "GCAE repo is not cloned. \n",
      "Tip: run 'gcaer::clone_gcae_repo(gcae_options = gcae_options)' \n",
      paste0(
        gcaer::gcae_options_to_str(gcae_options = gcae_options),
        collapse = "\n"
      )
    )
  }
  gcae_requirements_filename <- file.path(
    gcae_options$gcae_folder, "requirements.txt"
  )
  requirements <- readLines(gcae_requirements_filename)
  split_requirements <- stringr::str_match(
    string = requirements,
    pattern = "([a-z-]+)([=<>]=[0-9\\.]+)?"
  )
  split_requirements[is.na(split_requirements[, 3]), 3] <- ""
  packages <- tibble::tibble(
    package = split_requirements[, 2],
    version = split_requirements[, 3]
  )
  packages
}
