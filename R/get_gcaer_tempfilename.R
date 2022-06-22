#' Get a temporary filename
#'
#' Get a temporary filename, similar to \link{tempfile},
#' except that it always writes to a temporary folder
#' named \link{gcaer}.
#' @note this function is added to make sure no temporary
#' cache files are left undeleted
#' @param pattern	a non-empty character vector
#'   giving the initial part of the name.
#' @param fileext	a non-empty character vector
#'   giving the file extension
#' @return name for a temporary file
#' @examples
#' get_gcaer_tempfilename()
#' get_gcaer_tempfilename(pattern = "my_file")
#' get_gcaer_tempfilename(fileext = ".txt")
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcaer_tempfilename <- function(
  pattern = "file",
  fileext = ""
) {
  tempfile(
    pattern = pattern,
    tmpdir = file.path(gcaer::get_gcaer_folder(), basename(tempdir())),
    fileext = fileext
  )
}
