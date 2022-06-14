#' Get the number of neurons in the layent layer
#' @param x an input of type `model` or `gcae_experiment_params`
#' @return the number of neurons in the latent layer
#' @examples
#'
#' # A model
#' if (is_gcae_repo_cloned()) {
#'   # A real GCAE file
#'   model_filename <- get_gcae_model_filename("M1")
#' } else {
#'   # An example file
#'   model_filename <- get_gcaer_filename("M0.json")
#' }
#' model <- read_model_file(model_filename)
#' get_n_neurons_in_latent_layer(model)
#' @author Richèl J.C. Bilderbeek
#' @export
get_n_neurons_in_latent_layer <- function(x) {
  # Check data type
  if (gcaer::is_model(x)) {
    return(
      gcaer::get_n_neurons_in_latent_layer_from_model(model = x)
    )
  }
  if (gcaer::is_gcae_experiment_params()) {
    return(
      gcaer::get_n_neurons_in_latent_layer_from_gcae_experiment_params(
        gcae_experiment_params = x
      )
    )
  }

  stop(
    "'x' is of an unsupported data type. \n",
    "class(x): ", class(x), " \n",
    "Tip: use a 'model' or 'gcae_experiment_params'"
  )
}
