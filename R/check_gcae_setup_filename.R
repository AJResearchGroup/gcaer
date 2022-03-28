#' Check if the `gcae_setup_filename` is valid
#'
#' Check if the `gcae_setup_filename` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `gcae_setup_filename` is invalid.
#' @examples
#' check_gcae_setup_filename("gcae_setup.csv")
#' @author Richèl J.C. Bilderbeek
#' @export
check_gcae_setup_filename <- function(
  gcae_setup_filename
) {
  gcaer::check_csv_filename(csv_filename = gcae_setup_filename)
}
