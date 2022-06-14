#' Get the number of neurons in the layent layer from a `model`
#'
#' Get the number of neurons in the layent layer from a `model`
#' @inheritParams default_params_doc
#' @return the number of neurons in the latent layer
#' @seealso use \link{get_n_neurons_in_latent_layer}
#' to get the number of neurons in the latent layer
#' for different input arguments
#' @examples
#' if (is_gcae_repo_cloned()) {
#'   # A real GCAE file
#'   model_filename <- get_gcae_model_filename("M1")
#' } else {
#'   # An example file
#'   model_filename <- get_gcaer_filename("M0.json")
#' }
#' model <- read_model_file(model_filename)
#' get_n_neurons_in_latent_layer_from_model(model)
#' @author Richèl J.C. Bilderbeek
#' @export
get_n_neurons_in_latent_layer_from_model <- function(model) {
  gcaer::check_model(model)
  if (length(model$layers) == 1) {
    return(model$layers[[1]]$args$units)
  }

  is_dense <- purrr::map_lgl(model$layers, function(e) e$class == "Dense")
  has_name <- purrr::map_lgl(
    model$layers,
    function(e) "name" %in% names(e$args)
  )
  layer_index <- which(is_dense & has_name)
  testthat::expect_equal(1, length(layer_index))
  model$layers[[layer_index]]$args$units[[1]]
}
