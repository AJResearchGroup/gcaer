#' Get the path to the default \code{GCAE} folder as used by \link{gcaer}
#'
#' Get the path to the default \code{GCAE} folder as used by \link{gcaer}.
#' This is the folder where \code{GCAE} is installed
#'
#' Use \link{get_gcaer_folder} to get the folder where \link{gcaer}
#' stores its temporary files
#' @return path to the default \code{GCAE} folder as used by \link{gcaer}
#' @examples
#' get_gcae_folder()
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcae_folder <- function() {
  rappdirs::user_data_dir(appname = "GenoCAE")
}
