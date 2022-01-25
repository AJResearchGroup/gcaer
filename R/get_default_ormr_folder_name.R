#' Get the default \link[ormr]{ormr} folder used by `gcaer`
#' @return the default \link[ormr]{ormr} folder used by `gcaer`
#' @examples
#' get_default_ormr_folder_name()
#' @author Richèl J.C. Bilderbeek
#' @export
get_default_ormr_folder_name <- function() {
  rappdirs::user_data_dir(appname = "ormr_gcaer")
}
