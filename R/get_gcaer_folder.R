#' Get the folder where \link{gcaer} stores its temporary files
#'
#' Get the folder where \link{gcaer} stores its temporary files.
#'
#' Use `get_gcae_folder` to get the path to the folder when GCAE is installed.
#' @return path to the default \code{gcaer} cache folder
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcaer_folder <- function() {
  rappdirs::user_cache_dir(appname = "gcaer")
}
