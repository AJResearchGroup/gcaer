#' Get the GCAE subfolder
#' @export
get_gcae_subfolder <- function(gcae_options = create_gcae_options()) {
  gcaer::check_gcae_options(gcae_options)
  file.path(
    gcae_options$gcae_folder,
    paste0(
      "gcae_v",
      stringr::str_replace_all(gcae_options$gcae_version, "\\.", "_")
    )
  )
}
