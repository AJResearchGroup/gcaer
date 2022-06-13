#' Remove the `gcaer` temporary folder
#'
#' Remove the `gcaer` temporary folder
#' @return Nothing
#' @examples
#' if (plinkr::is_on_ci()) {
#'   remove_gcaer_tempfolder()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
remove_gcaer_tempfolder <- function() {
  unlink(dirname(get_gcaer_tempfilename()), recursive = TRUE)
  invisible(NULL)
}
