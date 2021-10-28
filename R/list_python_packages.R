#' List the Python packages and their versions
#' @inheritParams default_params_doc
#' @return the Python packages and their versions
#' @author Richèl J.C. Bilderbeek
#' @export
list_python_packages <- function(
  gcae_options = create_gcae_options()
) {
  tryCatch(
    python_binary_path <- gcaer::get_python_binary_path(
      gcae_options = gcae_options
    ),
    error = function(e) {
      stop(
        "'python_binary_path' not found \n",
        "Tip: run 'gcaer::install_miniconda' \n",
        "Full error message: ", e$message
      )
    }
  )

  system2(
    python_binary_path,
    c("-m", "pip", "list")
  )

  # /home/richel/.local/share/r-miniconda/envs/r-reticulate/bin/python -m pip list

}
