#' Save a `gcae_experiment_params` to file
#' @inheritParams default_params_doc
#' @return Nothing
#' @seealso
#' Use \link{read_gcae_experiment_params_file} to read
#' a `gcae_experiment_params` from file
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
save_gcae_experiment_params <- function(
  gcae_experiment_params,
  gcae_experiment_params_filename # nolint indeed a long variable name
) {
  gcaer::check_gcae_experiment_params(gcae_experiment_params)
  gcaer::check_gcae_experiment_params_filename(gcae_experiment_params_filename)

  t_setup <- tibble::tibble(
    parameter = names(gcae_experiment_params$gcae_setup),
    value = as.character(unlist(gcae_experiment_params$gcae_setup))
  )
  t_options <- tibble::tibble(
    parameter = names(gcae_experiment_params$gcae_options),
    value = as.character(unlist(gcae_experiment_params$gcae_options))
  )

  # must be one string to save
  gcae_experiment_params$analyse_epochs <- paste0(
    gcae_experiment_params$analyse_epochs,
    collapse = ","
  )

  # remains
  all_names <- names(gcae_experiment_params)
  good_name_indices <- which(
    all_names != "gcae_options" & all_names != "gcae_setup"
  )
  t_other <- tibble::tibble(
    parameter = names(gcae_experiment_params)[good_name_indices],
    value = as.character(unlist(gcae_experiment_params[good_name_indices]))
  )
  t <- dplyr::bind_rows(t_setup, t_other, t_options)

  dir.create(
    dirname(gcae_experiment_params_filename),
    recursive = TRUE,
    showWarnings = FALSE
  )
  readr::write_csv(x = t, file = gcae_experiment_params_filename)

  # back to numeric vector
  gcae_experiment_params$analyse_epochs <- as.numeric(
    stringr::str_split(
      gcae_experiment_params$analyse_epochs,
      pattern = ","
    )[[1]]
  )

  invisible(gcae_experiment_params)
}
