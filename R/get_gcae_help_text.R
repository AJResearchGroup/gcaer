#' Get the text of the gcae help file
#' @inheritParams default_params_doc
#' @return the text of the gcae help file
#' @author Richèl J.C. Bilderbeek
#' @examples
#' if (is_gcae_installed()) {
#'
#'   # Default version
#'   get_gcae_help_text()
#' }
#' @export
get_gcae_help_text <- function(
  gcae_options = create_gcae_options()
) {
  gcaer::run_gcae(
    args = "--help",
    gcae_options = gcae_options
  )
}
