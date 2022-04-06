#' Check if the `gcae_experiment_params_filename` is valid
#'
#' Check if the `gcae_experiment_params_filename` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing.
#' Will \link{stop} if `gcae_experiment_params_filename` is invalid.
#' @examples
#' check_gcae_experiment_params_filename("gcae_experiment_params.csv")
#' @author Richèl J.C. Bilderbeek
#' @export
check_gcae_experiment_params_filename <- function( # nolint indeed a long function name
  gcae_experiment_params_filename # nolint indeed a long variable name
) {
  gcaer::check_csv_filename(csv_filename = gcae_experiment_params_filename)
  invisible(gcae_experiment_params_filename)
}
