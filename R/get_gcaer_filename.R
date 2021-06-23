#' Get the path to a gcaer file
#' @inheritParams default_params_doc
#' @return the path to a gcaer file, if it exists.
#'   Will \link{stop} if the file does not exist
#' @examples
#' if (1 == 2) get_gcaer_filename("gcae.log")
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcaer_filename <- function(
  example_filename
) {
  full_path <- system.file("extdata", example_filename, package = "gcaer")
  if (!file.exists(full_path)) {
    stop(
      "'filename' must be the name of a file in 'inst/extdata'. \n",
      "Tip: use:\n",
      " \n",
      "gcaer::get_gcaer_filenames() \n",
      " \n",
      "to get a list of all gcaer files \n"
    )
  }
  full_path
}
