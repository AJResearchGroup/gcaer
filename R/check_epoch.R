#' Check if the `epoch` is valid
#'
#' Check if the `epoch` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `epoch` is invalid.
#' @examples
#' check_epoch(100)
#' @author Richèl J.C. Bilderbeek
#' @export
check_epoch <- function(
  epoch
) {
  gcaer::check_epochs(epochs = epoch)
}
