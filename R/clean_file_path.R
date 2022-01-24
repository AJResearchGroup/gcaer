#' Cleans up a file path
#'
#' Cleans up a file path:
#'  * Remove double slashes
#'
#' @param file_path path to a file as a string
#' @return a cleaned-up string
#' @examples
#' # Does nothing on clean paths
#' clean_file_path("~/HO_superpopulations")
#'
#' # Replace the double slashes by single slashes
#' clean_file_path("~//HO_superpopulations")
#' @author Richèl J.C. Bilderbeek
#' @export
clean_file_path <- function(file_path) {
  stringr::str_replace_all(
    string = file_path,
    pattern = "//",
    replacement = "/"
  )
}
