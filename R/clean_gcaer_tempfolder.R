#' Remove all `gcaer` temporary files
#'
#' Remove all `gcaer` temporary files
#' @return Nothing
#' @examples
#' if (plinkr::is_on_ci()) {
#'   clean_gcaer_tempfolder()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
clean_gcaer_tempfolder <- function() {
  file.remove(
    list.files(
      path = dirname(get_gcaer_tempfilename()),
      full.names = TRUE,
      recursive = TRUE
    )
  )
  invisible(NULL)
}
