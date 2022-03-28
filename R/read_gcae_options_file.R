#' Read a `gcae_options` from file
#' @inheritParams default_params_doc
#' @return the `gcae_options`
#' as can be checked by \link{check_gcae_options}
#' @seealso use \link{save_gcae_options} to save a `gcae_options`
#' @examples
#' # Create a gcae_options
#' gcae_options <- create_gcae_options()
#'
#' # Use a temporary file
#' gcae_options_filename <- get_gcaer_tempfilename(fileext = ".csv")
#'
#' # Save gcae_options to temporary file
#' save_gcae_options(
#'   gcae_options = gcae_options,
#'   gcae_options_filename = gcae_options_filename
#' )
#'
#' # Load the temporary file to get a copy of the gcae_options
#' gcae_options_again <- read_gcae_options_file(gcae_options_filename)
#'
#' # Cleanup
#' file.remove(gcae_options_filename)
#' @author Richèl J.C. Bilderbeek
#' @export
read_gcae_options_file <- function(gcae_options_filename) {
  testthat::expect_true(file.exists(gcae_options_filename))
  gcaer::check_gcae_options_filename(gcae_options_filename)
  t <- readr::read_csv(
    file = gcae_options_filename,
    col_types = readr::cols(
      parameter = readr::col_character(),
      value = readr::col_character()
    )
  )
  testthat::expect_true("gcae_folder" %in% t$parameter)
  gcae_folder <- t$value[which("gcae_folder" == t$parameter)]

  testthat::expect_true("ormr_folder_name" %in% t$parameter)
  ormr_folder_name <- t$value[which("ormr_folder_name" == t$parameter)]

  testthat::expect_true("gcae_version" %in% t$parameter)
  gcae_version <- t$value[which("gcae_version" == t$parameter)]

  testthat::expect_true("python_version" %in% t$parameter)
  python_version <- t$value[which("python_version" == t$parameter)]

  gcaer::create_gcae_options(
    gcae_folder = gcae_folder,
    ormr_folder_name = ormr_folder_name,
    gcae_version = gcae_version,
    python_version = python_version
  )
}
