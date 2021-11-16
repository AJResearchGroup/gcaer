#' Determine if `pip` is installed
#' @inheritParams default_params_doc
#' @return TRUE if `pip` is installed
#' @examples
#' is_pip_installed()
#' @author Richèl J.C. Bilderbeek
#' @export
is_pip_installed <- function(
  gcae_options = create_gcae_options(),
  verbose = FALSE
) {
  result <- FALSE
  tryCatch({
      gcaer::check_pip_is_installed(gcae_options = gcae_options)
      result <- TRUE
    },
    error = function(e) {
      if (verbose) {
        message(e$message)
      }
    }
  )
  testthat::expect_equal(length(result), 1)

  if (1 == 2) {
    conda_binary_path <- gcaer::get_conda_binary_path(gcae_options = gcae_options)
    if (!file.exists(conda_binary_path)) {
      stop(
        "'conda_binary_path' not found at ", conda_binary_path, " \n",
        "Tip: use 'install_miniconda'"
      )

    }
    tryCatch(
      suppressMessages(
        suppressWarnings(
          packages <- gcaer::list_python_packages(gcae_options = gcae_options)
        )
      ),
      warning = function(e) {
        return(FALSE)
      },
      error = function(e) {
        return(FALSE)
      }
    )
    tryCatch(
      "pip" %in% gcaer::list_python_packages(gcae_options = gcae_options),
      warning = function(e) {
        return(FALSE)
      },
      error = function(e) {
        return(FALSE)
      }
    )
  }
  result
}
