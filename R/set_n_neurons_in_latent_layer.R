#' Set the number of neurons in the latent layer
#' @inheritParams default_params_doc
#' @return the model with the desired number of neurons in the latent layer
#' @examples
#' if (is_gcae_installed()) {
#'   model_filename <- get_gcae_model_filename("M1")
#'   model <- read_model_file(model_filename)
#'   model <- set_n_neurons_in_latent_layer(
#'     model = model,
#'     n_neurons = 1
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
set_n_neurons_in_latent_layer <- function(
  model,
  n_neurons
) {
  gcaer::check_model(model)
  gcaer::check_n_neurons(n_neurons)

  if (length(model$layers) == 1) {
    model$layers[[1]]$args$units <- n_neurons
    return(model)
  }
  is_dense <- purrr::map_lgl(model$layers, function(e) e$class == "Dense")
  has_name <- purrr::map_lgl(model$layers, function(e) "name" %in% names(e$args))
  layer_index <- which(is_dense & has_name)
  testthat::expect_equal(1, length(layer_index))
  model$layers[[layer_index]]$args$units <- n_neurons
  model
}
