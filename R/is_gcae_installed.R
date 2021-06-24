#' Determine if `GCAE` is installed
#' @inheritParams default_params_doc
#' @return `TRUE` if `GCAE` is installed
#' @examples
#' is_gcae_installed()
#' @author Richèl J.C. Bilderbeek
#' @export
is_gcae_installed <- function(
  gcae_options = create_gcae_options()
) {
  gcaer::check_gcae_options(gcae_options)
  gcae_subfolder <- gcaer::get_gcae_subfolder(gcae_options = gcae_options)
  dir.exists(gcae_subfolder)
}
