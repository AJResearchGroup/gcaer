#' Get the full paths to all gcaer files
#' @return the full paths to all gcaer files
#' @examples
#' get_gcaer_filenames()
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcaer_filenames <- function(
) {
  list.files(
    system.file("extdata", package = "gcaer"),
    full.names = TRUE
  )
}
