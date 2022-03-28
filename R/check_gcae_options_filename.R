#' Check if the `gcae_options_filename` is valid
#'
#' Check if the `gcae_options_filename` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `gcae_options_filename` is invalid.
#' @examples
#' check_gcae_options_filename("gcae_options.csv")
#' @author Richèl J.C. Bilderbeek
#' @export
check_gcae_options_filename <- function(
  gcae_options_filename
) {
  gcaer::check_csv_filename(csv_filename = gcae_options_filename)
}
