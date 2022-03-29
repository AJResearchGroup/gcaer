#' Check if the `epoch` is valid
#'
#' Check if the `epoch` is valid
#' Will \link{stop} if not.
#'
#' Note that in some contexts, `epoch` cannot be zero.
#' That condition will be checked in that context.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `epoch` is invalid.
#' @examples
#' check_epoch(0) # For example, before the experiment start
#' check_epoch(1) # For example, after a first training epoch
#' check_epoch(100)
#' @author Richèl J.C. Bilderbeek
#' @export
check_epoch <- function(
  epoch
) {
  gcaer::check_epochs(epochs = epoch)
}
