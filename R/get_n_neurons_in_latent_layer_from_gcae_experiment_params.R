#' Get the number of neurons in the layent layer from a `gcae_experiment_params`
#'
#' Get the number of neurons in the layent layer from a `gcae_experiment_params`
#' @inheritParams default_params_doc
#' @return the number of neurons in the latent layer
#' @seealso use \link{get_n_neurons_in_latent_layer}
#' to get the number of neurons in the latent layer
#' for different input arguments
#' @examples
#' if (is_gcae_script_fixed()) {
#'   get_n_neurons_in_latent_layer_from_gcae_experiment_params(
#'     create_test_gcae_experiment_params()
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_n_neurons_in_latent_layer_from_gcae_experiment_params <- function( # nolint indeed a long function name
  gcae_experiment_params
) {
  gcaer::check_gcae_experiment_params(gcae_experiment_params)
  model_filename <- gcaer::get_gcae_model_filename(
    model_id = gcae_experiment_params$gcae_setup$model_id,
    gcae_options = gcae_experiment_params$gcae_options
  )
  testthat::expect_true(file.exists(model_filename))
  model <- read_model_file(model_filename = model_filename)
  gcaer::get_n_neurons_in_latent_layer_from_model(model = model)
}
