#' Set the number of neurons in the latent layer
#' @inheritParams default_params_doc
#' @return the model with the desired number of neurons in the latent layer
#' @examples
#' if (is_gcae_repo_cloned()) {
#'   # A real GCAE file
#'   model_filename <- get_gcae_model_filename("M1")
#' } else {
#'   # An example file
#'   model_filename <- get_gcaer_filename("M0.json")
#' }
#' model <- read_model_file(model_filename)
#' new_model <- set_n_neurons_in_latent_layer(
#'   model = model,
#'   n_neurons = 1
#' )
#' get_n_neurons_in_latent_layer(new_model)
#' @author Richèl J.C. Bilderbeek
#' @export
set_n_neurons_in_latent_layer <- function(
  model,
  n_neurons
) {
  gcaer::check_model(model)
  gcaer::check_n_neurons(n_neurons)
  if (n_neurons == 0) {
    stop("Cannot set latent layer to zero neurons")
  }

  testthat::expect_true(length(model$layers) > 1)
  is_dense <- purrr::map_lgl(model$layers, function(e) e$class == "Dense")
  has_name <- purrr::map_lgl(
    model$layers,
    function(e) "name" %in% names(e$args)
  )
  layer_index <- which(is_dense & has_name)
  testthat::expect_equal(1, length(layer_index))
  model$layers[[layer_index]]$args$units <- n_neurons
  model
}
