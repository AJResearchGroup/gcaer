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
  gcae_subfolder <- file.path(
    gcae_options$gcae_folder, "gcae_v",
    stringr::str_replace_all(gcae_options$gcae_version, "\\.", "_")
  )
  dir.exists(gcae_subfolder)
}
