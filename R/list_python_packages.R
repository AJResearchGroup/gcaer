#' List the Python packages and their versions
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with two rows:
#'  * `package`: the package name
#'  * `version`: the package version
#' @author Richèl J.C. Bilderbeek
#' @export
list_python_packages <- function(
  gcae_options = create_gcae_options(),
  verbose = FALSE
) {
  python_binary_path <- character(0)
  tryCatch(
    python_binary_path <- gcaer::get_python_binary_path(
      gcae_options = gcae_options
    ),
    error = function(e) {
      stop(
        "'python_binary_path' not found at ", python_binary_path, "\n",
        "Tip: run 'gcaer::install_miniconda()' \n",
        "Full error message: ", e$message
      )
    }
  )
  if (verbose) {
    message("python_binary_path: ", python_binary_path)
  }
  # Cannot check if pip is installed,
  # as that is done by calling this function,
  # and see if 'pip' is in the list of installed Python packages.
  # Hence, uncommenting the line below will result in infinite recursion:
  # gcaer::check_pip_is_installed()                                             # nolint this is indeed commented code :-)
  text <- character(0)

  suppressWarnings(
    text <- system2(
      command = normalizePath(python_binary_path),
      args = c("-m", "pip", "list"),
      stdout = TRUE,
      stderr = TRUE
    )
  )
  text_matrix <- stringr::str_split(text, pattern = " +", simplify = TRUE)
  t_packages <- tibble::as_tibble(
    text_matrix[c(-1, -2), ],
    .name_repair = "minimal"
  )
  names(t_packages) <- tolower(text_matrix[1, ])
  if (verbose) {
    message("Packages found: \n", paste0(text, collapse = "\n"))
  }

  has_pip <- sum(t_packages$package == "pip") == 1
  if (!has_pip) {
    stop(
      "pip is not installed. \n",
      "'gcae_options$gcae_folder': ", gcae_options$gcae_folder, " \n",
      "'gcae_options$gcae_version': ", gcae_options$gcae_version, " \n",
      "Full error message: ", text, " \n",
      " \n",
      "Tip: run 'gcaer::install_pip()'"
    )
  }
  t_packages
}
