#' Get the number of neurons in the layent layer
#' @inheritParams default_params_doc
#' @return the number of neurons in the latent layer
#' @examples
#' model_filename <- get_gcae_model_filename("M1")
#' model <- read_model_file(model_filename)
#' n_neurons <- get_n_neurons_in_latent_layer(model)
#' @author Richèl J.C. Bilderbeek
#' @export
get_n_neurons_in_latent_layer <- function(model) {
  gcaer::check_model(model)
  if (length(model$layers) == 1) {
    return(model$layers[[1]]$args$units)
  }

  is_dense <- purrr::map_lgl(model$layers, function(e) e$class == "Dense")
  has_name <- purrr::map_lgl(model$layers, function(e) "name" %in% names(e$args))
  layer_index <- which(is_dense & has_name)
  testthat::expect_equal(1, length(layer_index))
  model$layers[[layer_index]]$args$units[[1]]
}
