#' Read a `gcae_experiment_params` from file
#' @inheritParams default_params_doc
#' @return the `gcae_experiment_params`
#' as can be checked by \link{check_gcae_experiment_params}
#' @seealso use \link{save_gcae_experiment_params}
#' to save a `gcae_experiment_params`
#' @examples
#' # Create a gcae_experiment_params
#' gcae_experiment_params <- create_test_gcae_experiment_params()
#'
#' # Use a temporary file
#' gcae_experiment_params_filename <- get_gcaer_tempfilename(fileext = ".csv")
#'
#' # Save gcae_experiment_params to temporary file
#' save_gcae_experiment_params(
#'   gcae_experiment_params = gcae_experiment_params,
#'   gcae_experiment_params_filename = gcae_experiment_params_filename
#' )
#'
#' # Load the temporary file to get a copy of the gcae_experiment_params
#' gcae_experiment_params_again <- read_gcae_experiment_params_file(
#'   gcae_experiment_params_filename
#' )
#'
#' # Cleanup
#' file.remove(gcae_experiment_params_filename)
#' @author Richèl J.C. Bilderbeek
#' @export
read_gcae_experiment_params_file <- function(gcae_experiment_params_filename) { # nolint indeed a long function name

  testthat::expect_true(file.exists(gcae_experiment_params_filename))
  gcaer::check_gcae_experiment_params_filename(gcae_experiment_params_filename)
  gcae_options <- gcaer::read_gcae_options_file(
    gcae_options_filename = gcae_experiment_params_filename
  )
  gcae_setup <- gcaer::read_gcae_setup_file(
    gcae_setup_filename = gcae_experiment_params_filename
  )
  t <- readr::read_csv(
    file = gcae_experiment_params_filename,
    col_types = readr::cols(
      parameter = readr::col_character(),
      value = readr::col_character()
    )
  )
  testthat::expect_true("analyse_epochs" %in% t$parameter)
  analyse_epochs <- t$value[which("analyse_epochs" == t$parameter)]
  analyse_epochs <- as.numeric(
    stringr::str_split(
      analyse_epochs,
      pattern = ","
    )[[1]]
  )

  testthat::expect_true("metrics" %in% t$parameter)
  metrics <- t$value[which("metrics" == t$parameter)]

  gcaer::create_gcae_experiment_params(
    gcae_options = gcae_options,
    gcae_setup = gcae_setup,
    analyse_epochs = analyse_epochs,
    metrics = metrics
  )
}
