#' Check if the `n_neurons` is valid
#'
#' Check if the `n_neurons` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `n_neurons` is invalid.
#' @examples
#' check_n_neurons(0)
#' check_n_neurons(1)
#' check_n_neurons(100)
#' @author Richèl J.C. Bilderbeek
#' @export
check_n_neurons <- function(
  n_neurons
) {
  gcaer::check_epochs(epochs = n_neurons)
}
