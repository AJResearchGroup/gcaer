#' Get the text of the gcae help file
#' @inheritParams default_params_doc
#' @return the text of the gcae help file
#' @author Richèl J.C. Bilderbeek
#' @examples
#' if (plinkr::is_on_ci()) {
#'   if (is_gcae_installed()) {
#'     get_gcae_help_text()
#'   }
#' }
#' @export
get_gcae_help_text <- function(
  gcae_options = create_gcae_options(),
  verbose = FALSE
) {
  gcaer::run_gcae(
    args = "--help",
    gcae_options = gcae_options,
    verbose = verbose
  )
}
