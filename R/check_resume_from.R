#' Check if the `resume_from` is valid
#'
#' Check if the `resume_from` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `resume_from` is invalid.
#' @examples
#' check_resume_from(100)
#' @author Richèl J.C. Bilderbeek
#' @export
check_resume_from <- function(
  resume_from
) {
  gcaer::check_epochs(epochs = resume_from)
  invisible(resume_from)
}
